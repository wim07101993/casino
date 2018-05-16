using System.Collections.Generic;
using SlotMachine.Models;
using SlotMachine.Services;
using SlotMachine.ViewModelInerfaces;

namespace SlotMachine.ViewModels
{
    public class ColorSelectorViewModel: IColorSelectorViewModel
    {
        public ColorSelectorViewModel(IColorProvider colorProvider)
        {
            Colors = colorProvider.ColorThemes;
        }

        public List<ColorTheme> Colors { get; }
    }
}
