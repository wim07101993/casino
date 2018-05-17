using System.Collections.Generic;
using System.Windows.Media;
using Prism.Mvvm;

namespace SlotMachine.Models
{
    public class ColorTheme : BindableBase
    {
        private string _name;

        private Dictionary<string, Color> _primaryColors;
        private Dictionary<string, Color> _accentColors;


        public string Name
        {
            get => _name;
            set => SetProperty(ref _name, value);
        }

        public Dictionary<string, Color> PrimaryColors
        {
            get => _primaryColors;
            set => SetProperty(ref _primaryColors, value);
        }

        public Dictionary<string, Color> AccentColors
        {
            get => _accentColors;
            set => SetProperty(ref _accentColors, value);
        }

        public Color Primary700
            => PrimaryColors != null && PrimaryColors.ContainsKey("Primary700")
                ? PrimaryColors["Primary700"]
                : default(Color);

        public Color Primary400
            => PrimaryColors != null && PrimaryColors.ContainsKey("Primary400")
                ? PrimaryColors["Primary400"]
                : default(Color);

        public Color Primary200
            => PrimaryColors != null && PrimaryColors.ContainsKey("Primary200")
                ? PrimaryColors["Primary200"]
                : default(Color);

        public Color Accent700
            => AccentColors != null && AccentColors.ContainsKey("Accent700")
                ? AccentColors["Accent700"]
                : default(Color);

        public Color Accent400
            => AccentColors != null && AccentColors.ContainsKey("Accent400")
                ? AccentColors["Accent400"]
                : default(Color);

        public Color Accent200
            => AccentColors != null && AccentColors.ContainsKey("Accent200")
                ? AccentColors["Accent200"]
                : default(Color);
    }
}