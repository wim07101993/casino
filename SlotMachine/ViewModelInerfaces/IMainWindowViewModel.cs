using System.Collections.ObjectModel;
using System.Windows.Input;

namespace SlotMachine.ViewModelInerfaces
{
    public interface IMainWindowViewModel
    {
        ObservableCollection<int> Numbers { get; }

        ICommand RollCommand { get; }
        bool YouWon { get; }
    }
}
