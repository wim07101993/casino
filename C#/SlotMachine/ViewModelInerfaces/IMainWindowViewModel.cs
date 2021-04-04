using System.Collections.ObjectModel;
using System.Windows.Input;
using Shared.Models;

namespace SlotMachine.ViewModelInerfaces
{
    public interface IMainWindowViewModel
    {
        IColorSelectorViewModel ColorSelectorViewModel { get; }
        ISymbolSelectorViewModel SymbolSelectorViewModel { get; }

        int NumberOfSlots { get; set; }

        ObservableCollection<Number> Numbers { get; }

        ICommand RollCommand { get; }
        bool YouWon { get; }
        bool IsRunning { get; }
    }
}
