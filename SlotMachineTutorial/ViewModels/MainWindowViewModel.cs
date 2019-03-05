using Prism.Commands;
using Prism.Mvvm;
using SlotMachine.ViewModelInerfaces;
using SlotMachineTutorial.Models;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Linq;
using System.Windows.Input;

namespace SlotMachineTutorial.ViewModels
{
    public class MainWindowViewModel : BindableBase, IMainWindowViewModel
    {
        #region FIELDS

        private bool _youWon;
        private int _numberOfSlots = 2;

        #endregion FIELDS


        #region CONSTRUCTOR

        public MainWindowViewModel()
        {
            RollCommand = new DelegateCommand(RandomizeNumbers);

            Numbers = new ObservableCollection<Number>();
            RefreshSymbols();
        }

        #endregion CONSTRUCTOR


        #region PROPERTIES
        
        public ICommand RollCommand { get; }

        public bool YouWon
        {
            get => _youWon;
            private set => SetProperty(ref _youWon, value);
        }

        public ObservableCollection<Number> Numbers { get; }

        #endregion PROPERTIES


        #region METHODS

        public void RandomizeNumbers()
        {
            foreach (var number in Numbers)
            {
                var _ = number.RandomizeAsync();
            }
        }

        public void RefreshSymbols()
        {
            Numbers.Clear();
            for (var i = 0; i < _numberOfSlots; i++)
            {
                var number = new Number { Value = Number.MaxValue };
                number.PropertyChanged += OnNumberPropertyChanged;
                Numbers.Add(number);
            }
        }

        private void OnNumberPropertyChanged(object sender, PropertyChangedEventArgs e)
        {
            switch (e.PropertyName)
            {
                case nameof(Number.IsRandomizing):
                    if (!Numbers.Any(x => x.IsRandomizing))
                    {
                        var firstNumber = Numbers.First().Value;
                        YouWon = Numbers.All(x => x.Value == firstNumber);
                    }

                    break;
            }
        }

        #endregion METHODS
    }
}
