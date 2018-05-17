using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Windows.Input;
using SlotMachine.Models;

namespace SlotMachine.ViewModelInerfaces
{
    public interface IMainWindowViewModel
    {
        IColorSelectorViewModel ColorSelectorViewModel { get; }

        IEnumerable<int> SlotPossibilities { get; }
        int NumberOfSlots { get; set; }

        ObservableCollection<Number> Numbers { get; }

        ICommand RollCommand { get; }
        bool YouWon { get; }
        bool IsRunning { get; }
    }
}
