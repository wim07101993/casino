using System.Collections.ObjectModel;
using System.Windows.Input;
using SlotMachine.Models;

namespace SlotMachine.ViewModelInerfaces
{
    public interface IMainWindowViewModel
    {
        IColorSelectorViewModel ColorSelectorViewModel { get; }

        ObservableCollection<Number> Numbers { get; }

        ICommand RollCommand { get; }
        bool YouWon { get; }
        
    }
}
