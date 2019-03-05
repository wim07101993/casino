using System.Windows.Input;

namespace SlotMachine.ViewModelInerfaces
{
    public interface IMainWindowViewModel
    {
        ICommand RollCommand { get; }
        bool YouWon { get; }
    }
}
