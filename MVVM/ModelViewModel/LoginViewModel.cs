using System.ComponentModel;
using System.Text.RegularExpressions;
using System.Windows.Input;

namespace Mockup.MVVM.ModelViewModel
{
    class LoginViewModel : INotifyPropertyChanged
    {
        private string _userNumber;
        private string _password;
        private string _errorMessage;
        private string _passwordErrorMessage;
        private bool _isErrorVisible;
        private bool _isPasswordErrorVisible;
        private bool _isLoginEnabled;

        public event PropertyChangedEventHandler PropertyChanged;

        public string UserNumber
        {
            get => _userNumber;
            set
            {
                _userNumber = SanitizeUsernumber(value);
                OnPropertyChanged(nameof(UserNumber));
                ValidateForm();
            }
        }
        public string Password
        {
            get => _password;
            set
            {
                _password = value;
                OnPropertyChanged(nameof(Password));
                ValidateForm();
            }
        }
        public string ErrorMessage
        {
            get => _errorMessage;
            set
            {
                _errorMessage = value;
                OnPropertyChanged(nameof(ErrorMessage));
            }
        }
        public string PasswordErrorMessage
        {
            get => _passwordErrorMessage;
            set
            {
                _passwordErrorMessage = value;
                OnPropertyChanged(nameof(PasswordErrorMessage));
            }
        }
        public bool IsErrorVisible
        {
            get => _isErrorVisible;
            set
            {
                _isErrorVisible = value;
                OnPropertyChanged(nameof(IsErrorVisible));
            }
        }
        public bool IsPasswordErrorVisible
        {
            get => _isPasswordErrorVisible;
            set
            {
                _isPasswordErrorVisible = value;
                OnPropertyChanged(nameof(IsPasswordErrorVisible));
            }
        }
        public bool IsLoginEnabled
        {
            get => _isLoginEnabled;
            set
            {
                _isLoginEnabled = value;
                OnPropertyChanged(nameof(IsLoginEnabled));
            }
        }

        // Comandos para iniciar sesión y navegar a otras páginas.
        public ICommand LoginCommand { get; }
        public ICommand GoToRegisterCommand { get; }
        public ICommand GoToRecoverPasswordCommand { get; }

        public LoginViewModel()
        {
            LoginCommand = new Command(ExecuteLogin);
            GoToRegisterCommand = new Command(async () => await Shell.Current.GoToAsync("//RegisterPage"));
            GoToRecoverPasswordCommand = new Command(async () => await Shell.Current.GoToAsync("//RecoverPasswordPage"));
        }

        // Filtra el valor ingresado en el usuario permitiendo solo ciertos caracteres y limitándolo a 12.
        private string SanitizeUsernumber(string input)
        {
            string sanitized = Regex.Replace(input ?? "", "[^a-zA-Z0-9._,@!*+-]", "");
            return sanitized.Length > 12 ? sanitized.Substring(0, 12) : sanitized;
        }

        private void ValidateForm()
        {
            bool isValid = true;

            // Validación del usuario.
            // Si no se ha ingresado nada, se deja sin error (no se muestra mensaje).
            if (string.IsNullOrWhiteSpace(UserNumber))
            {
                ErrorMessage = "";
                IsErrorVisible = false;
                isValid = false;
            }
            else if (UserNumber.Length < 3)
            {
                ErrorMessage = "El usuario debe tener entre 3 y 12 caracteres.";
                IsErrorVisible = true;
                isValid = false;
            }
            else
            {
                ErrorMessage = "";
                IsErrorVisible = false;
            }

            // Validación de la contraseña.
            // No se muestra ningún mensaje si aún no se ha ingresado ningún carácter.
            if (string.IsNullOrWhiteSpace(Password))
            {
                PasswordErrorMessage = "";
                IsPasswordErrorVisible = false;
                isValid = false;
            }
            else if (!IsValidPassword(Password))
            {
                PasswordErrorMessage = "La contraseña debe tener al menos 8 caracteres.\nUna mayúscula.\nUna minúscula.\nUn número y un carácter especial.";
                IsPasswordErrorVisible = true;
                isValid = false;
            }
            else
            {
                PasswordErrorMessage = "";
                IsPasswordErrorVisible = false;
            }

            // Habilitar el botón de login solo si ambos campos tienen datos y son válidos.
            IsLoginEnabled = isValid &&
                             !string.IsNullOrWhiteSpace(UserNumber) &&
                             !string.IsNullOrWhiteSpace(Password);
        }

        // Valida la contraseña mediante una expresión regular.
        private bool IsValidPassword(string password)
        {
            if (string.IsNullOrWhiteSpace(password)) return false;
            var regex = new Regex(@"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%_\-*.?&])[A-Za-z\d@$!%_\-*.?&]{8,}$");
            return regex.IsMatch(password);
        }

        // Ejecuta el login si el formulario es válido.
        private async void ExecuteLogin()
        {
            if (IsLoginEnabled)
            {
                await Shell.Current.GoToAsync($"//UserDashboardPage?username=Ruben González&UserNumber={UserNumber}");
            }
        }

        // Método para limpiar todos los campos y mensajes (por ejemplo, al navegar fuera de la página).
        public void ClearFields()
        {
            UserNumber = string.Empty;
            Password = string.Empty;
            ErrorMessage = string.Empty;
            PasswordErrorMessage = string.Empty;
            IsErrorVisible = false;
            IsPasswordErrorVisible = false;
            IsLoginEnabled = false;
        }

        private void OnPropertyChanged(string propertyName)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }
    }
}
