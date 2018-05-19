using System.Windows;
using Prism.Events;
using Shared.Models;
using SlotMachine.Models;
using SlotMachine.Services;
using SlotMachine.Services.Implementations;
using SlotMachine.ViewModelInerfaces;
using SlotMachine.ViewModels;
using SlotMachine.Views;
using Unity;
using Unity.Lifetime;

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
                .RegisterType<IEventAggregator, EventAggregator>(new ContainerControlledLifetimeManager())
                .RegisterType<IColorProvider, ColorProvider>(new ContainerControlledLifetimeManager())
                .RegisterType<IColorThemeService, ColorThemeService>(new ContainerControlledLifetimeManager())
                .RegisterType<ISymbolProvider, SymbolProvider>(new ContainerControlledLifetimeManager())
                .RegisterType<ISymbolThemeService, SymbolThemeService>(new ContainerControlledLifetimeManager())
                .RegisterType<IColorSelectorViewModel, ColorSelectorViewModel>()
                .RegisterType<ISymbolSelectorViewModel, SymbolSelectorViewModel>()
                .RegisterType<IMainWindowViewModel, MainWindowViewModel>();
        }
    }
}