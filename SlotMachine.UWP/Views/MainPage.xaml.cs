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
                .RegisterType<IMainPageViewModel, MainPageViewModel>();
            

            InitializeComponent();

            DataContext = Container.Resolve<IMainPageViewModel>();
        }

        public IUnityContainer Container { get;  }
    }
}
