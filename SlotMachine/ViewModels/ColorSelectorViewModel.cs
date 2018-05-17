using System.Collections.Generic;
using System.Linq;
using System.Windows.Input;
using Prism.Commands;
using SlotMachine.Models;
using SlotMachine.Services;
using SlotMachine.ViewModelInerfaces;

namespace SlotMachine.ViewModels
{
    public class ColorSelectorViewModel: IColorSelectorViewModel
    {
        private readonly IColorThemeService _colorThemeService;

        public ColorSelectorViewModel(IColorProvider colorProvider, IColorThemeService colorThemeService)
        {
            _colorThemeService = colorThemeService;
            ChangeAccentColorCommand = new DelegateCommand<ColorTheme>(ChangeAccentColor);
            ChangePrimaryColorCommand = new DelegateCommand<ColorTheme>(ChangePrimaryColor);

            Colors = colorProvider.ColorThemes;
        }


        public List<ColorTheme> Colors { get; }

        public IEnumerable<ColorTheme> PrimaryColorThemes
            => Colors.Where(x => x.PrimaryColors != null && x.PrimaryColors.Any());

        public IEnumerable<ColorTheme> AccentColorThemes
            => Colors.Where(x => x.AccentColors != null && x.AccentColors.Any());

        public ICommand ChangeAccentColorCommand { get; }
        public ICommand ChangePrimaryColorCommand { get; }


        public void ChangeAccentColor(ColorTheme colorTheme)
        {
            _colorThemeService.ReplaceAccentColor(colorTheme);
        }

        public void ChangePrimaryColor(ColorTheme colorTheme)
        {
            _colorThemeService.ReplacePrimaryColor(colorTheme);
        }
    }
}
