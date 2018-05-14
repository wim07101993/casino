using System;
using System.Collections.ObjectModel;
using System.Windows.Documents;
using System.Windows.Input;
using Prism.Commands;
using Prism.Mvvm;
using SlotMachine.ViewModelInerfaces;

namespace SlotMachine.ViewModels
{
    public class MainWindowViewModel : BindableBase, IMainWindowViewModel
    {
        #region FIELDS

        private static readonly Random Random = new Random();

        private bool _youWon;
        private ObservableCollection<int> _numbers;

        #endregion FIELDS


        #region CONSTRUCTOR

        public MainWindowViewModel()
        {
            _numbers = new ObservableCollection<int>{0,1,2,3};
            RollCommand = new DelegateCommand(RandomizeNumbers);
        }

        #endregion CONSTRUCTOR


        #region PROPERTIES

        public ObservableCollection<int> Numbers
        {
            get => _numbers;
            private set => SetProperty(ref _numbers , value);
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
            for (var i = 0; i < Numbers.Count; i++)
                Numbers[i] = Random.Next(7);

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