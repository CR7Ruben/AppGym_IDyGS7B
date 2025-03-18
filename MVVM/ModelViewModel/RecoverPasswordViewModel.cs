using System.ComponentModel;
using System.Text.RegularExpressions;
using System.Windows.Input;
using Microsoft.Maui.Controls;
using System.Threading.Tasks;

namespace Mockup.MVVM.ModelViewModel
{
    public class RecoverPasswordViewModel : INotifyPropertyChanged
    {
        private string _username;
        private string _errorMessage;
        private bool _isErrorVisible;
        private bool _isContinueEnabled;

        // Evento para notificar cambios en las propiedades.
        public event PropertyChangedEventHandler PropertyChanged;

        public string Username
        {
            get => _username;
            set
            {
                // Se limpia la entrada para permitir solo caracteres válidos.
                string cleanedValue = Regex.Replace(value ?? "", "[^a-zA-Z0-9._,@!*+-]", "");
                if (cleanedValue.Length > 12)
                    cleanedValue = cleanedValue.Substring(0, 12);

                _username = cleanedValue;
                OnPropertyChanged(nameof(Username));
                ValidateUsername();
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

        public bool IsErrorVisible
        {
            get => _isErrorVisible;
            set
            {
                _isErrorVisible = value;
                OnPropertyChanged(nameof(IsErrorVisible));
            }
        }

        public bool IsContinueEnabled
        {
            get => _isContinueEnabled;
            set
            {
                _isContinueEnabled = value;
                OnPropertyChanged(nameof(IsContinueEnabled));
            }
        }

        // Comandos para los botones.
        public ICommand ContinueCommand { get; }
        public ICommand GoToRegisterCommand { get; }

        public RecoverPasswordViewModel()
        {
            // Comando para el botón de continuar.
            ContinueCommand = new Command(ExecuteContinue);
            // Comando para el enlace de registro.
            GoToRegisterCommand = new Command(async () => await Shell.Current.GoToAsync("//RegisterPage"));
        }

        private void ValidateUsername()
        {
            // Validaciones del usuario.
            if (string.IsNullOrWhiteSpace(Username))
            {
                IsErrorVisible = false;
                IsContinueEnabled = false;
            }
            else if (Username.Length < 3)
            {
                IsErrorVisible = false;
                IsContinueEnabled = false;
            }
            else
            {
                IsErrorVisible = false;
                IsContinueEnabled = true;
            }
        }

        private async void ExecuteContinue()
        {
            if (!string.IsNullOrWhiteSpace(Username))
            {
                await Shell.Current.GoToAsync("//EnterCodePage");
            }
        }

        // Método para limpiar los datos y mensajes.
        public void ClearFields()
        {
            Username = string.Empty;
            ErrorMessage = string.Empty;
            IsErrorVisible = false;
            IsContinueEnabled = false;
        }

        // Método para notificar cambios en la UI.
        private void OnPropertyChanged(string propertyName)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }
    }
}
