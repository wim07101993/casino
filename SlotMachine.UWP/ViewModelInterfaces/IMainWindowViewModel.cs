using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Windows.Input;
using Shared.Models;

namespace SlotMachine.UWP.ViewModelInterfaces
{
    public interface IMainWindowViewModel : INotifyPropertyChanged
    {
       int NumberOfSlots { get; set; }

        ObservableCollection<Number> Numbers { get; }

        ICommand RollCommand { get; }
        bool YouWon { get; }
        bool IsRunning { get; }
    }
}