using SlotMachineTutorial.ViewModelInterfaces;

namespace SlotMachineTutorial.Views
{
    public partial class MainWindow 
    {
        public MainWindow(IMainWindowViewModel viewModel)
        {
            InitializeComponent();
            DataContext = viewModel;
        }
    }
}
