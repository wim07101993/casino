using System;
using System.Windows.Input;
using Prism.Commands;
using Prism.Mvvm;
using SlotMachine.ViewModelInerfaces;

namespace SlotMachine.ViewModels
{
    public class MainWindowViewModel : BindableBase, IMainWindowViewModel
    {
        #region FIELDS

        private int _thirdNumber;
        private int _firstNumber;
        private int _secondNumber;
        private bool _youWon;

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
            private set => SetProperty(ref _firstNumber, value);
        }

        public int SecondNumber
        {
            get => _secondNumber;
            private set => SetProperty(ref _secondNumber, value);
        }

        public int ThirdNumber
        {
            get => _thirdNumber;
            private set => SetProperty(ref _thirdNumber, value);
        }

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
            FirstNumber = Random.Next(4);
            SecondNumber = Random.Next(4);
            ThirdNumber = Random.Next(4);

            if (FirstNumber == SecondNumber && SecondNumber == ThirdNumber)
                YouWon = true;
            else
                YouWon = false;
        }

        #endregion METHODS
    }
}