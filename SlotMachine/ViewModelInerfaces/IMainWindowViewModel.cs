using System.Windows.Input;

namespace SlotMachine.ViewModelInerfaces
{
    public interface IMainWindowViewModel
    {
        int FirstNumber { get; }
        int SecondNumber { get; }
        int ThirdNumber { get; }

        ICommand RollCommand { get; }
    }
}
