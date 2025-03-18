using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using System.Text.RegularExpressions;

namespace Mockup.MVVM.ModelViewModel
{
    public partial class RegisterViewModel : ObservableObject
    {
        // Propiedad para el usuario.
        [ObservableProperty]
        private string username;

        // Propiedad para la contraseña.
        [ObservableProperty]
        private string password;

        // Propiedad para confirmar la contraseña.
        [ObservableProperty]
        private string confirmPassword;

        // Mensaje de error para el campo de usuario.
        [ObservableProperty]
        private string usernameError;

        // Mensaje de error para la contraseña.
        [ObservableProperty]
        private string passwordError;

        // Mensaje de error para la confirmación de la contraseña.
        [ObservableProperty]
        private string confirmPasswordError;

        // Banderas para mostrar u ocultar los mensajes de error.
        [ObservableProperty]
        private bool isUsernameErrorVisible;

        [ObservableProperty]
        private bool isPasswordErrorVisible;

        [ObservableProperty]
        private bool isConfirmPasswordErrorVisible;

        // Indica si el botón de registro está habilitado.
        [ObservableProperty]
        private bool isRegisterEnabled;

        // Comando para registrar y para navegar a la página de Login.
        public IRelayCommand RegisterCommand { get; }
        public IRelayCommand GoToLoginCommand { get; }

        public RegisterViewModel()
        {
            RegisterCommand = new AsyncRelayCommand(RegisterAsync);
            GoToLoginCommand = new AsyncRelayCommand(GoToLoginAsync);
        }

        // Se ejecuta cuando cambia el valor de Username.
        partial void OnUsernameChanged(string value)
        {
            if (!string.IsNullOrEmpty(value))
            {
                // Permitir solo letras, números y ciertos caracteres especiales.
                var filtered = Regex.Replace(value, "[^a-zA-Z0-9._,@!*+-]", "");
                // Limitar a 12 caracteres.
                if (filtered.Length > 12)
                    filtered = filtered.Substring(0, 12);

                if (filtered != value)
                {
                    Username = filtered;
                    return;
                }
            }
            Validate();
        }

        // Se ejecuta cuando cambia el valor de Password.
        partial void OnPasswordChanged(string value)
        {
            Validate();
        }

        // Se ejecuta cuando cambia el valor de ConfirmPassword.
        partial void OnConfirmPasswordChanged(string value)
        {
            Validate();
        }

        // Método que valida los campos y muestra los errores solo si ya se ingresó texto.
        private void Validate()
        {
            bool isValid = true;

            // Validar Username: no se muestra error si está vacío.
            if (string.IsNullOrWhiteSpace(Username))
            {
                UsernameError = string.Empty;
                IsUsernameErrorVisible = false;
                isValid = false;
            }
            else if (Username.Length < 3 || Username.Length > 12)
            {
                UsernameError = "El usuario debe tener entre 3 y 12 caracteres.";
                IsUsernameErrorVisible = true;
                isValid = false;
            }
            else
            {
                UsernameError = string.Empty;
                IsUsernameErrorVisible = false;
            }

            // Validar Password: no mostrar mensaje hasta que se ingrese un carácter.
            if (string.IsNullOrWhiteSpace(Password))
            {
                PasswordError = string.Empty;
                IsPasswordErrorVisible = false;
                isValid = false;
            }
            else if (!IsValidPassword(Password))
            {
                PasswordError = "La contraseña debe tener al menos 8 caracteres.\nUna mayúscula.\nUna minúscula.\nUn número y un carácter especial.";
                IsPasswordErrorVisible = true;
                isValid = false;
            }
            else
            {
                PasswordError = string.Empty;
                IsPasswordErrorVisible = false;
            }

            // Validar ConfirmPassword: no mostrar mensaje hasta que se ingrese un carácter.
            if (string.IsNullOrWhiteSpace(ConfirmPassword))
            {
                ConfirmPasswordError = string.Empty;
                IsConfirmPasswordErrorVisible = false;
                isValid = false;
            }
            else if (Password != ConfirmPassword)
            {
                ConfirmPasswordError = "Las contraseñas no coinciden.";
                IsConfirmPasswordErrorVisible = true;
                isValid = false;
            }
            else
            {
                ConfirmPasswordError = string.Empty;
                IsConfirmPasswordErrorVisible = false;
            }

            IsRegisterEnabled = isValid;
        }

        // Método que valida la contraseña usando una expresión regular.
        private bool IsValidPassword(string password)
        {
            if (string.IsNullOrWhiteSpace(password)) return false;
            var regex = new Regex(@"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%-_*?&])[A-Za-z\d@$!%-_*?&]{8,}$");
            return regex.IsMatch(password);
        }

        // Comando que se ejecuta al pulsar el botón de registro.
        private async Task RegisterAsync()
        {
            // Validaciones adicionales (por si acaso).
            if (string.IsNullOrWhiteSpace(Username) || Username.Length < 3 || Username.Length > 12)
            {
                await Application.Current.MainPage.DisplayAlert("Error", "El usuario debe tener entre 3 y 12 caracteres.", "OK");
                return;
            }

            if (string.IsNullOrWhiteSpace(Password) || !IsValidPassword(Password))
            {
                await Application.Current.MainPage.DisplayAlert("Error", "La contraseña debe cumplir con los requisitos.", "OK");
                return;
            }

            if (Password != ConfirmPassword)
            {
                await Application.Current.MainPage.DisplayAlert("Error", "Las contraseñas no coinciden.", "OK");
                return;
            }

            // Mostrar mensaje de éxito y navegar a la página de Login.
            await Application.Current.MainPage.DisplayAlert("Éxito", "Tu registro ha sido exitoso.", "Iniciar sesión");
            await Shell.Current.GoToAsync("//LoginPage");
        }

        // Comando para navegar a la página de Login.
        private async Task GoToLoginAsync()
        {
            await Shell.Current.GoToAsync("//LoginPage");
        }

        // Método público para limpiar todos los datos y mensajes (se invoca al salir de la página).
        public void ClearFields()
        {
            Username = string.Empty;
            Password = string.Empty;
            ConfirmPassword = string.Empty;
            UsernameError = string.Empty;
            PasswordError = string.Empty;
            ConfirmPasswordError = string.Empty;
            IsUsernameErrorVisible = false;
            IsPasswordErrorVisible = false;
            IsConfirmPasswordErrorVisible = false;
            IsRegisterEnabled = false;
        }
    }
}
