using System.Collections.Generic;
using System.Windows.Input;
using SlotMachine.Models;

namespace SlotMachine.ViewModelInerfaces
{
    public interface IColorSelectorViewModel
    {
        List<ColorTheme> Colors { get; }

        IEnumerable<ColorTheme> PrimaryColorThemes { get; }
        IEnumerable<ColorTheme> AccentColorThemes { get; }

        ColorTheme SelectedAccent { set; }
        ColorTheme SelectedPrimary { set; }
    }
}