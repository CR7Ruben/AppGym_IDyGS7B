using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace Mockup.MVVM.ModelViewModel
{
    public partial class NewPasswordViewModel : ObservableObject
    {
        // Propiedad para la nueva contraseña.
        [ObservableProperty]
        private string newPassword;

        // Propiedad para confirmar la nueva contraseña.
        [ObservableProperty]
        private string confirmPassword;

        // Propiedad para el mensaje de error de la contraseña.
        [ObservableProperty]
        private string passwordError;

        // Propiedad para el mensaje de error cuando las contraseñas no coinciden.
        [ObservableProperty]
        private string confirmPasswordError;

        // Indica si se debe mostrar el mensaje de error en la contraseña.
        [ObservableProperty]
        private bool isPasswordErrorVisible;

        // Indica si se debe mostrar el mensaje de error cuando las contraseñas no coinciden.
        [ObservableProperty]
        private bool isConfirmPasswordErrorVisible;

        // Propiedad que indica si el botón de cambio de contraseña está habilitado.
        [ObservableProperty]
        private bool isChangePasswordEnabled;

        // Comando que se ejecuta al presionar el botón de cambiar contraseña.
        public IRelayCommand ChangePasswordCommand { get; }

        public NewPasswordViewModel()
        {
            ChangePasswordCommand = new AsyncRelayCommand(ChangePasswordAsync);
        }

        // Se ejecuta cuando cambia el valor de NewPassword.
        partial void OnNewPasswordChanged(string value)
        {
            ValidatePasswords();
        }

        // Se ejecuta cuando cambia el valor de ConfirmPassword.
        partial void OnConfirmPasswordChanged(string value)
        {
            ValidatePasswords();
        }

        // Valida que la nueva contraseña cumpla con los criterios y que coincida con la confirmación.
        private void ValidatePasswords()
        {
            bool isValid = IsValidPassword(newPassword);

            // Mostrar error de contraseña solo si se ingresó al menos un carácter.
            if (string.IsNullOrEmpty(newPassword))
            {
                PasswordError = string.Empty;
                IsPasswordErrorVisible = false;
            }
            else if (!isValid)
            {
                PasswordError = "La contraseña debe tener al menos 8 caracteres.\nUna mayúscula.\nUna minúscula.\nUn número y un carácter especial.";
                IsPasswordErrorVisible = true;
            }
            else
            {
                PasswordError = string.Empty;
                IsPasswordErrorVisible = false;
            }

            // Mostrar error de confirmación solo si se ingresó al menos un carácter en ese campo.
            if (string.IsNullOrEmpty(confirmPassword))
            {
                ConfirmPasswordError = string.Empty;
                IsConfirmPasswordErrorVisible = false;
            }
            else if (!string.IsNullOrEmpty(newPassword) && newPassword != confirmPassword)
            {
                ConfirmPasswordError = "Las contraseñas no coinciden.";
                IsConfirmPasswordErrorVisible = true;
            }
            else
            {
                ConfirmPasswordError = string.Empty;
                IsConfirmPasswordErrorVisible = false;
            }

            // Habilitar el botón solo si la contraseña es válida, se ingresó confirmación y ambas coinciden.
            IsChangePasswordEnabled = isValid &&
                                      !string.IsNullOrEmpty(confirmPassword) &&
                                      (newPassword == confirmPassword);
        }

        // Valida la contraseña usando una expresión regular.
        private bool IsValidPassword(string password)
        {
            if (string.IsNullOrWhiteSpace(password))
                return false;

            var regex = new Regex(@"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%-_*?&])[A-Za-z\d@$!%-_*?&]{8,}$");
            return regex.IsMatch(password);
        }

        // Método que se ejecuta al presionar el botón para cambiar la contraseña.
        private async Task ChangePasswordAsync()
        {
            // Limpiar las credenciales almacenadas.
            try
            {
                SecureStorage.Remove("username");
                SecureStorage.Remove("password");
                System.Diagnostics.Debug.WriteLine("Credenciales borradas exitosamente.");
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Error al borrar credenciales: " + ex.Message);
            }

            // Mostrar mensaje de éxito.
            await Application.Current.MainPage.DisplayAlert("Éxito", "Tu contraseña ha sido cambiada exitosamente.", "Iniciar sesión");

            // Redirigir a la página de login.
            await Shell.Current.GoToAsync("//LoginPage");
        }

        // Método para limpiar todos los datos y mensajes de error.
        public void ClearFields()
        {
            NewPassword = string.Empty;
            ConfirmPassword = string.Empty;
            PasswordError = string.Empty;
            ConfirmPasswordError = string.Empty;
            IsPasswordErrorVisible = false;
            IsConfirmPasswordErrorVisible = false;
            IsChangePasswordEnabled = false;
        }
    }
}
