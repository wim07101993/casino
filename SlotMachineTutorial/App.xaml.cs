using Prism.Events;
using SlotMachineTutorial.Views;
using System.Windows;
using Unity;

namespace SlotMachineTutorial
{
    public partial class App
    {
        public IUnityContainer UnityContainer { get; private set; }


        protected override void OnStartup(StartupEventArgs e)
        {
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
                .RegisterSingleton<IEventAggregator, EventAggregator>();
        }
    }
}
