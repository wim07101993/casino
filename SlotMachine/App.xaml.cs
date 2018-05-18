using System.Windows;
using SlotMachine.Models;
using SlotMachine.Services;
using SlotMachine.Services.Implementations;
using SlotMachine.ViewModelInerfaces;
using SlotMachine.ViewModels;
using SlotMachine.Views;
using Unity;

namespace SlotMachine
{
    public partial class App
    {
        public IUnityContainer UnityContainer { get; private set; }

        protected override void OnStartup(StartupEventArgs e)
        {
            Number.MinSpinTime = 100;
            Number.MaxSpinTime = 2000;

            base.OnStartup(e);

            RegisterTypes();

            MainWindow = UnityContainer.Resolve<MainWindow>();
            if (MainWindow != null)
                MainWindow.Show();
            else
                MessageBox.Show("No window to show.");
        }

        private void RegisterTypes()
        {
            UnityContainer = new UnityContainer()
                .RegisterType<IColorProvider, ColorProvider>()
                .RegisterType<IColorThemeService, ColorThemeService>()
                .RegisterType<ISymbolProvider, SymbolProvider>()
                .RegisterType<ISymbolThemeService, SymbolThemeService>()
                .RegisterType<IColorSelectorViewModel, ColorSelectorViewModel>()
                .RegisterType<ISymbolSelectorViewModel, SymbolSelectorViewModel>()
                .RegisterType<IMainWindowViewModel, MainWindowViewModel>();
        }
    }
}