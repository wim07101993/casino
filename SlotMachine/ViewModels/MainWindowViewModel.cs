using System.Collections.ObjectModel;
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

        public MainWindowViewModel()
        {
            Numbers = new ObservableCollection<Number>
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

            var firstNumber = Numbers.First().Value;
            YouWon = Numbers.All(x => x.Value == firstNumber);
        }

        #endregion METHODS
    }
}