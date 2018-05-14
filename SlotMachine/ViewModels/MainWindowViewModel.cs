using System;
using System.Collections.ObjectModel;
using System.Windows.Documents;
using System.Windows.Input;
using Prism.Commands;
using Prism.Mvvm;
using SlotMachine.Models;
using SlotMachine.ViewModelInerfaces;

namespace SlotMachine.ViewModels
{
    public class MainWindowViewModel : BindableBase, IMainWindowViewModel
    {
        #region FIELDS

        private static readonly Random Random = new Random();

        private bool _youWon;
        private ObservableCollection<Number> _numbers;

        #endregion FIELDS


        #region CONSTRUCTOR

        public MainWindowViewModel()
        {
            _numbers = new ObservableCollection<Number>
            {
                new Number(),
                new Number(),
                new Number(),
                new Number()
            };

            RollCommand = new DelegateCommand(RandomizeNumbers);
        }

        #endregion CONSTRUCTOR


        #region PROPERTIES

        public ObservableCollection<Number> Numbers
        {
            get => _numbers;
            private set => SetProperty(ref _numbers, value);
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
            foreach (var number in Numbers)
                number.Randomize();

            var allAreEqual = true;
            for (var i = 1; i < Numbers.Count; i++)
                if (Numbers[i - 1] != Numbers[i])
                {
                    allAreEqual = false;
                    break;
                }

            YouWon = allAreEqual;
        }

        #endregion METHODS
    }
}