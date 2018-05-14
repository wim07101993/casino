using System.Windows;
using SlotMachine.Views;
using Unity;

namespace SlotMachine
{
    public partial class App
    {
        public IUnityContainer UnityContainer { get; private set; }

        protected override void OnStartup(StartupEventArgs e)
        {
            base.OnStartup(e);

            UnityContainer = new UnityContainer();

            MainWindow = UnityContainer.Resolve<MainWindow>();
            if (MainWindow != null)
                MainWindow.Show();
            else
                MessageBox.Show("No window to show.");
        }
    }
}