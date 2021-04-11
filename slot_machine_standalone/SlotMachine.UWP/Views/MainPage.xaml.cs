using System;
using System.Linq;
using Windows.Devices.Gpio;
using Windows.UI.Core;
using Windows.UI.Xaml;
using SlotMachine.UWP.ViewModelInterfaces;
using SlotMachine.UWP.ViewModels;
using Unity;

namespace SlotMachine.UWP.Views
{
    public sealed partial class MainPage
    {
        private const int ButtonPin = 5;
        private GpioPin _button;

        public MainPage()
        {
            Container = new UnityContainer()
                .RegisterType<IMainPageViewModel, MainPageViewModel>();

            Unloaded += MainPageUnloaded;

            InitializeComponent();
            InitializeGPIO();

            DataContext = Container.Resolve<IMainPageViewModel>();
        }

        public IUnityContainer Container { get; }


        private void InitializeGPIO()
        {
            var gpio = GpioController.GetDefault();
            if (gpio == null)
            {
                RollButton.Visibility = Visibility.Visible;
                return;
            }

            RollButton.Visibility = Visibility.Collapsed;
            _button = gpio.OpenPin(ButtonPin);
            _button.SetDriveMode(GpioPinDriveMode.Input);
            _button.ValueChanged += ButtonValueChanged;
        }

        private void MainPageUnloaded(object sender, RoutedEventArgs e)
        {
            if (_button != null)
            {
                _button.ValueChanged -= ButtonValueChanged;
                _button.Dispose();
            }
        }

        private async void ButtonValueChanged(GpioPin sender, GpioPinValueChangedEventArgs args)
        {
            await Dispatcher.RunAsync(CoreDispatcherPriority.Normal, () =>
            {
                if (DataContext == null)
                    return;

                if (args.Edge == GpioPinEdge.FallingEdge)
                    RollButton.Command?.Execute(null);
            });
        }
    }
}