using System.Collections.ObjectModel;
using System.Windows.Input;
using SlotMachineTutorial.Models;

namespace SlotMachineTutorial.ViewModelInterfaces
{
    public interface IMainWindowViewModel
    {
        ObservableCollection<Number> Numbers { get; }

        ICommand RollCommand { get; }
        bool YouWon { get; }
    }
}
