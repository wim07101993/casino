using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Linq;
using System.Windows.Input;
using Prism.Commands;
using Prism.Mvvm;
using Shared.Models;
using SlotMachine.UWP.ViewModelInterfaces;

namespace SlotMachine.UWP.ViewModels
{
    public class MainPageViewModel : BindableBase, IMainPageViewModel
    {
        #region FIELDS

        private bool _youWon;
        private int _numberOfSlots;
        private bool _isRunning;
        private ObservableCollection<Number> _numbers;

        #endregion FIELDS


        #region CONSTRUCTOR

        public MainPageViewModel()
        {
            Numbers = new ObservableCollection<Number>();

            NumberOfSlots = 4;

            RollCommand = new DelegateCommand(RandomizeNumbers);
        }

        #endregion CONSTRUCTOR


        #region PROPERTIES

        public int NumberOfSlots
        {
            get => _numberOfSlots;
            set
            {
                if (!SetProperty(ref _numberOfSlots, value))
                    return;

                RefreshSymbols();
            }
        }

        public ObservableCollection<Number> Numbers
        {
            get => _numbers;
            set => SetProperty(ref _numbers, value);
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

        public void RefreshSymbols()
        {
            if (NumberOfSlots == Numbers.Count)
            {
                Numbers = new ObservableCollection<Number>(Numbers);
                return;
            }

            Numbers.Clear();
            for (var i = 0; i < _numberOfSlots; i++)
            {
                var number = new Number {Value = Number.MaxValue};
                number.PropertyChanged += OnNumberPropertyChanged;
                Numbers.Add(number);
            }
        }

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