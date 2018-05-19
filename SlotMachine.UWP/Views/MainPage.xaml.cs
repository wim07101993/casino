using SlotMachine.UWP.ViewModelInterfaces;
using SlotMachine.UWP.ViewModels;
using Unity;

namespace SlotMachine.UWP.Views
{
    public sealed partial class MainPage
    {
        public MainPage()
        {
            Container = new UnityContainer()
                .RegisterType<IMainWindowViewModel, MainWindowViewModel>();
            

            InitializeComponent();

            DataContext = Container.Resolve<IMainWindowViewModel>();
        }

        public IUnityContainer Container { get;  }
    }
}
