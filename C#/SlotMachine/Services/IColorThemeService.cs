using SlotMachine.Models;

namespace SlotMachine.Services
{
    public interface IColorThemeService
    {
        void ReplacePrimaryColor(ColorTheme colorTheme);
        void ReplaceAccentColor(ColorTheme colorTheme);
    }
}