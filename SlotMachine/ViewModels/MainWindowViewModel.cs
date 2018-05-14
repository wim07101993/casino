using Prism.Mvvm;
using SlotMachine.ViewModelInerfaces;

namespace SlotMachine.ViewModels
{
    public class MainWindowViewModel : BindableBase, IMainWindowViewModel
    {
        #region FIELDS

        private int _thirdNumber = 0;
        private int _firstNumber = 1;
        private int _secondNumber = 2;

        #endregion FIELDS


        #region CONSTRUCTOR

        public MainWindowViewModel()
        {
            
        }

        #endregion CONSTRUCTOR


        #region PROPERTIES

        public int FirstNumber
        {
            get => _firstNumber;
            set => SetProperty(ref _firstNumber, value);
        }

        public int SecondNumber
        {
            get => _secondNumber;
            set => SetProperty(ref _secondNumber, value);
        }

        public int ThirdNumber
        {
            get => _thirdNumber;
            set => SetProperty(ref _thirdNumber, value);
        }

        #endregion PROPERTIES
    }
}