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
    }
}