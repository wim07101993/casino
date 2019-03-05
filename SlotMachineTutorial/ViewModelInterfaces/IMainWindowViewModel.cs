using SlotMachineTutorial.Models;
using System.Collections.ObjectModel;
using System.Windows.Input;

namespace SlotMachine.ViewModelInerfaces
{
    public interface IMainWindowViewModel
    {
        ObservableCollection<Number> Numbers { get; }

        ICommand RollCommand { get; }
        bool YouWon { get; }
    }
}
