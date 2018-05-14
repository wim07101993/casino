using System;
using System.Threading.Tasks;
using System.Windows.Input;
using Prism.Commands;
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

        private static readonly Random Random = new Random();

        #endregion FIELDS


        #region CONSTRUCTOR

        public MainWindowViewModel()
        {
            RollCommand = new DelegateCommand(RandomizeNumbers);
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

        public ICommand RollCommand { get; }

        #endregion PROPERTIES


        #region METHODS

        public void RandomizeNumbers()
        {
            FirstNumber = Random.Next(4);
            SecondNumber = Random.Next(4);
            ThirdNumber = Random.Next(4);
        }

        #endregion METHODS
    }
}