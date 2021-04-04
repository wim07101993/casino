using System;
using System.Collections.Generic;
using System.Windows.Media;
using Prism.Events;
using SlotMachine.Helpers.PubSubEvents;
using SlotMachine.Models;

namespace SlotMachine.Services.Implementations
{
    public class ColorThemeService : AResourceService, IColorThemeService
    {
        private readonly IEventAggregator _eventAggregator;


        public ColorThemeService(IEventAggregator eventAggregator)
        {
            _eventAggregator = eventAggregator;
        }


        public void ReplacePrimaryColor(ColorTheme colorTheme)
        {
            ReplaceColor(colorTheme, "Primary");
            _eventAggregator
                .GetEvent<PrimaryColorsChangedEvent>()
                .Publish(colorTheme);
        }

        public void ReplaceAccentColor(ColorTheme colorTheme)
        {
            ReplaceColor(colorTheme, "Accent");
            _eventAggregator
                .GetEvent<AccentColorsChangedEvent>()
                .Publish(colorTheme);
        }

        private void ReplaceColor(ColorTheme colorTheme, string colorType)
        {
            if (colorTheme == null)
                throw new ArgumentNullException(nameof(colorTheme));

            Dictionary<string, Color> colors;
            switch (colorType)
            {
                case "Accent":
                    colors = colorTheme.AccentColors;
                    break;
                case "Primary":
                    colors = colorTheme.PrimaryColors;
                    break;
                default:
                    throw new ArgumentException("color type not found", nameof(colorType));
            }

            ReplaceEntry($"{colorType}DarkBrush", colors[$"{colorType}700"]);
            ReplaceEntry($"{colorType}MidBrush", colors[$"{colorType}400"]);
            ReplaceEntry($"{colorType}LightBrush", colors[$"{colorType}200"]);

            ReplaceEntry($"{colorType}DarkForegroundBrush", colors[$"{colorType}700Foreground"]);
            ReplaceEntry($"{colorType}MidForegroundBrush", colors[$"{colorType}400Foreground"]);
            ReplaceEntry($"{colorType}LightForegroundBrush", colors[$"{colorType}200Foreground"]);
        }
    }
}