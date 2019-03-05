using Prism.Commands;
using Prism.Mvvm;
using SlotMachine.ViewModelInerfaces;
using System.Windows.Input;

namespace SlotMachineTutorial.ViewModels
{
    public class MainWindowViewModel : BindableBase, IMainWindowViewModel
    {
        #region FIELDS

        private bool _youWon;
        private int _numberOfSlots;

        #endregion FIELDS


        #region CONSTRUCTOR

        public MainWindowViewModel()
        {
            RollCommand = new DelegateCommand(RandomizeNumbers);
        }

        #endregion CONSTRUCTOR


        #region PROPERTIES
        
        public ICommand RollCommand { get; }

        public bool YouWon
        {
            get => _youWon;
            private set => SetProperty(ref _youWon, value);
        }
        
        #endregion PROPERTIES


        #region METHODS
        
        public void RandomizeNumbers()
        {
            // TODO
        }
        
        #endregion METHODS
    }
}
