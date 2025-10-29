using Microsoft.Maui.Controls;
using System;
using System.Collections.ObjectModel;
using System.IO;
using Microsoft.Maui.Dispatching;
using QRCoder;
using Microsoft.Maui.Graphics;

namespace Mockup
{
    [QueryProperty(nameof(UserNumber), "userNumber")]
    public partial class UserDashboardPage : ContentPage
    {
        //Propiedades privadas
        private string _username;
        private string _userNumber;
        private bool _isRoutinePickerVisible;
        private bool _isDatePickerVisible;
        private IDispatcherTimer qrTimer;

        //Lista de rutinas disponibles
        public ObservableCollection<string> RoutineOptions { get; } = new ObservableCollection<string>
        {
            "Pecho", "Bíceps", "Tríceps", "Espalda", "Pierna"
        };

        //Rutina seleccionada
        private string _selectedRoutine;
        public string SelectedRoutine
        {
            get => _selectedRoutine;
            set
            {
                _selectedRoutine = value;
                OnPropertyChanged(nameof(SelectedRoutine));
            }
        }

        //Fecha seleccionada
        private DateTime _selectedDate = DateTime.Today;
        public DateTime SelectedDate
        {
            get => _selectedDate;
            set
            {
                _selectedDate = value;
                OnPropertyChanged(nameof(SelectedDate));
            }
        }

        //Nombre de usuario
        public string Username
        {
            get => _username;
            set
            {
                _username = value;
                OnPropertyChanged(nameof(Username));
            }
        }

        //Número de usuario
        public string UserNumber
        {
            get => _userNumber;
            set
            {
                _userNumber = value;
                OnPropertyChanged(nameof(UserNumber));
            }
        }

        //Constructor
        public UserDashboardPage()
        {
            InitializeComponent();
            BindingContext = this;

            // 📆 Establecer fecha máxima (zona horaria de Sonora)
            TimeZoneInfo sonoraTimeZone = TimeZoneInfo.FindSystemTimeZoneById("America/Hermosillo");
            DateTime sonoraNow = TimeZoneInfo.ConvertTime(DateTime.Now, sonoraTimeZone);
            ActivityDatePicker.MaximumDate = sonoraNow.Date;

            // Iniciar QR dinámico
            GenerateDynamicQRCode();
            StartQrTimer();
        }

        //Generar un QR dinámico con contenido único temporal (puedes personalizarlo)
        private void GenerateDynamicQRCode()
        {
            // El código puede incluir el número de usuario + timestamp para más seguridad
            string uniqueCode = $"{UserNumber}-{DateTimeOffset.UtcNow.ToUnixTimeSeconds()}";

            using (QRCodeGenerator qrGenerator = new QRCodeGenerator())
            {
                QRCodeData qrCodeData = qrGenerator.CreateQrCode(uniqueCode, QRCodeGenerator.ECCLevel.Q);
                PngByteQRCode qrCode = new PngByteQRCode(qrCodeData);
                byte[] qrCodeBytes = qrCode.GetGraphic(20);

                // Mostrar QR en la vista
                QrImage.Source = ImageSource.FromStream(() => new MemoryStream(qrCodeBytes));
            }

            // Si quieres almacenarlo en BD, puedes enviarlo aquí
            // SaveCodeToDatabase(uniqueCode);
        }

        //Refrescar QR dinámico cada 15 segundos
        private void StartQrTimer()
        {
            qrTimer = Dispatcher.CreateTimer();
            qrTimer.Interval = TimeSpan.FromSeconds(15); // ⏳ Cambia este número si quieres otro intervalo
            qrTimer.Tick += (s, e) => GenerateDynamicQRCode();
            qrTimer.Start();
        }

        //Cerrar sesión
        private async void OnLogoutClicked(object sender, EventArgs e)
        {
            bool confirm = await DisplayAlert("Cerrar sesión", "¿Estás seguro de que quieres cerrar sesión?", "Sí", "No");
            if (confirm)
            {
                qrTimer?.Stop();
                await Shell.Current.GoToAsync("//LoginPage");
            }
        }

        //Mostrar/ocultar selector de fecha
        private void OnShowDatePicker(object sender, EventArgs e)
        {
            _isDatePickerVisible = !_isDatePickerVisible;
            ActivityDatePicker.IsVisible = _isDatePickerVisible;
        }

        //Mostrar/ocultar botones de días de rutina
        private void OnShowRoutineButtons(object sender, EventArgs e)
        {
            DaysButtonsLayout.IsVisible = !DaysButtonsLayout.IsVisible;
        }

        //Navegar a la rutina seleccionada
        private async void OnDaySelected(object sender, EventArgs e)
        {
            var button = sender as Button;
            var routinePage = button?.CommandParameter?.ToString();

            Page page = routinePage switch
            {
                "RoutineMondayPage" => new RoutineMondayPage(),
                "RoutineTuesdayPage" => new RoutineTuesdayPage(),
                "RoutineWednesdayPage" => new RoutineWednesdayPage(),
                "RoutineThursdayPage" => new RoutineThursdayPage(),
                "RoutineFridayPage" => new RoutineFridayPage(),
                "RoutineSaturdayPage" => new RoutineSaturdayPage(),
                "RoutineSundayPage" => new RoutineSundayPage(),
                _ => null
            };

            if (page != null)
            {
                await Navigation.PushAsync(page);
            }
        }

        //seleccionar una fecha
        private async void OnDateSelected(object sender, DateChangedEventArgs e)
        {
            await DisplayAlert("Fecha seleccionada", $"Has seleccionado: {e.NewDate.ToLongDateString()}", "OK");
        }
    }
}
