using System.Collections.Generic;
using SlotMachine.Models;

namespace SlotMachine.ViewModelInerfaces
{
    public interface IColorSelectorViewModel
    {
        List<ColorTheme> Colors { get; }
    }
}