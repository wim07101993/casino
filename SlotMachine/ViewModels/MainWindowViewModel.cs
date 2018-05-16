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

        #endregion FIELDS


        #region CONSTRUCTOR

        public MainWindowViewModel(IColorSelectorViewModel colorSelectorViewModel)
        {
            ColorSelectorViewModel = colorSelectorViewModel;

            Numbers = new ObservableCollection<Number>();

            for (var i = 0; i < 4; i++)
            {
                var number = new Number();
                number.PropertyChanged += OnNumberPropertyChanged;
                Numbers.Add(number);
            }

            RollCommand = new DelegateCommand(RandomizeNumbers);
        }

        #endregion CONSTRUCTOR


        #region PROPERTIES

        public IColorSelectorViewModel ColorSelectorViewModel { get; }

        public ObservableCollection<Number> Numbers { get; }

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