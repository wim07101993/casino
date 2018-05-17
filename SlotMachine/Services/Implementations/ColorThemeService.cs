using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Windows;
using System.Windows.Media;
using System.Windows.Media.Animation;
using SlotMachine.Models;

namespace SlotMachine.Services.Implementations
{
  public  class ColorThemeService : IColorThemeService
    {
        public virtual void ReplacePrimaryColor(ColorTheme colorTheme)
        {
            if (colorTheme == null)
                throw new ArgumentNullException(nameof(colorTheme));

            var colors = colorTheme.PrimaryColors;

            ReplaceEntry("PrimaryDarkBrush", colors["Primary700"]);
            ReplaceEntry("PrimaryMidBrush", colors["Primary400"]);
            ReplaceEntry("PrimaryLightBrush", colors["Primary200"]);

            ReplaceEntry("PrimaryDarkForegroundBrush", colors["Primary700Foreground"]);
            ReplaceEntry("PrimaryMidForegroundBrush", colors["Primary400Foreground"]);
            ReplaceEntry("PrimaryLightForegroundBrush", colors["Primary200Foreground"]);
        }

        public virtual void ReplaceAccentColor(ColorTheme colorTheme)
        {
            if (colorTheme == null)
                throw new ArgumentNullException(nameof(colorTheme));

            var colors = colorTheme.AccentColors;

            ReplaceEntry("AccentDarkBrush", colors["Accent700"]);
            ReplaceEntry("AccentMidBrush", colors["Accent400"]);
            ReplaceEntry("AccentLightBrush", colors["Accent200"]);

            ReplaceEntry("AccentDarkForegroundBrush", colors["Accent700Foreground"]);
            ReplaceEntry("AccentMidForegroundBrush", colors["Accent400Foreground"]);
            ReplaceEntry("AccentLightForegroundBrush", colors["Accent200Foreground"]);
        }

        /// <summary>
        /// Replaces a certain entry anywhere in the parent dictionary and its merged dictionaries
        /// </summary>
        /// <param name="entryName">The entry to replace</param>
        /// <param name="newValue">The new entry value</param>
        /// <param name="parentDictionary">The root dictionary to start searching at. Null means using Application.Current.Resources</param>
        private static void ReplaceEntry(object entryName, object newValue, ResourceDictionary parentDictionary = null)
        {
            if (parentDictionary == null)
                parentDictionary = Application.Current.Resources;

            if (parentDictionary.Contains(entryName))
                if (parentDictionary[entryName] is SolidColorBrush brush && !brush.IsFrozen)
                {
                    var animation = new ColorAnimation
                    {
                        From = ((SolidColorBrush) parentDictionary[entryName]).Color,
                        To = ((SolidColorBrush) newValue).Color,
                        Duration = new Duration(TimeSpan.FromMilliseconds(300))
                    };
                    brush.BeginAnimation(SolidColorBrush.ColorProperty, animation);
                }
                else
                    parentDictionary[entryName] = newValue; //Set value normally

            foreach (var dictionary in parentDictionary.MergedDictionaries)
                ReplaceEntry(entryName, newValue, dictionary);
        }
    }
}