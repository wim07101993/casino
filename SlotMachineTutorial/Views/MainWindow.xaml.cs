using SlotMachine.ViewModelInerfaces;

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
