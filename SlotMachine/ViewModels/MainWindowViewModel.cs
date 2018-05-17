using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Linq;
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

        private bool _youWon;
        private int _numberOfSlots;
        private ObservableCollection<Number> _numbers;
        private bool _isRunning;

        #endregion FIELDS


        #region CONSTRUCTOR

        public MainWindowViewModel(IColorSelectorViewModel colorSelectorViewModel)
        {
            ColorSelectorViewModel = colorSelectorViewModel;

            SlotPossibilities = Enumerable.Range(2, 4);
            NumberOfSlots = 4;

            RollCommand = new DelegateCommand(RandomizeNumbers);
        }

        #endregion CONSTRUCTOR


        #region PROPERTIES

        public IColorSelectorViewModel ColorSelectorViewModel { get; }

        public IEnumerable<int> SlotPossibilities { get; }

        public int NumberOfSlots
        {
            get => _numberOfSlots;
            set
            {
                if (!SetProperty(ref _numberOfSlots, value))
                    return;

                Numbers = new ObservableCollection<Number>();
                for (var i = 0; i < _numberOfSlots; i++)
                {
                    var number = new Number();
                    number.PropertyChanged += OnNumberPropertyChanged;
                    Numbers.Add(number);
                }
            }
        }

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

        public bool IsRunning
        {
            get => _isRunning;
            private set => SetProperty(ref _isRunning, value);
        }

        #endregion PROPERTIES


        #region METHODS

        public void RandomizeNumbers()
        {
            IsRunning = true;
            foreach (var number in Numbers)
                number.Randomize();
        }

        private void OnNumberPropertyChanged(object sender, PropertyChangedEventArgs e)
        {
            switch (e.PropertyName)
            {
                case nameof(Number.IsRandomizing):
                    if (!Numbers.Any(x => x.IsRandomizing))
                    {
                        IsRunning = false;
                        var firstNumber = Numbers.First().Value;
                        YouWon = Numbers.All(x => x.Value == firstNumber);
                    }

                    break;
            }
        }

        #endregion METHODS
    }
}