using System.Collections.Generic;
using System.Linq;
using Prism.Mvvm;
using SlotMachine.Helpers.Extensions;
using SlotMachine.Models;
using SlotMachine.Services;
using SlotMachine.ViewModelInerfaces;

namespace SlotMachine.ViewModels
{
    public class ColorSelectorViewModel : BindableBase, IColorSelectorViewModel
    {
        private readonly IColorThemeService _colorThemeService;

        public ColorSelectorViewModel(IColorProvider colorProvider, IColorThemeService colorThemeService)
        {
            _colorThemeService = colorThemeService;
            Colors = colorProvider.ColorThemes;
        }


        public List<ColorTheme> Colors { get; }

        public IEnumerable<ColorTheme> PrimaryColorThemes
            => Colors
                .Where(x => x.AccentColors != null && x.AccentColors.Any())
                .OrderBy(x => x.Accent700.GetHue());

        public IEnumerable<ColorTheme> AccentColorThemes
            => Colors
                .Where(x => x.AccentColors != null && x.AccentColors.Any())
                .OrderBy(x => x.Accent700.GetHue());

        public ColorTheme SelectedAccent
        {
            set => ChangeAccentColor(value);
        }

        public ColorTheme SelectedPrimary
        {
            set => ChangePrimaryColor(value);
        }


        public void ChangeAccentColor(ColorTheme colorTheme)
        {
            if (colorTheme == null)
                return;
            _colorThemeService.ReplaceAccentColor(colorTheme);
        }

        public void ChangePrimaryColor(ColorTheme colorTheme)
        {
            if (colorTheme == null)
                return;
            _colorThemeService.ReplacePrimaryColor(colorTheme);
        }
    }
}