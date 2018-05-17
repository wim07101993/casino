using System.Collections.Generic;
using System.Windows.Input;
using SlotMachine.Models;

namespace SlotMachine.ViewModelInerfaces
{
    public interface IColorSelectorViewModel
    {
        List<ColorTheme> Colors { get; }
        ICommand ChangeAccentColorCommand { get; }
        ICommand ChangePrimaryColorCommand { get; }
    }
}