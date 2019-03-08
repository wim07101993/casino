using System;
using System.Windows;
using System.Windows.Media;
using System.Windows.Media.Animation;
using Prism.Events;
using SlotMachineTutorial.Models;

namespace SlotMachineTutorial.Services.Implementations
{
    public class SymbolThemeService : ISymbolThemeService
    {
        private readonly IEventAggregator _eventAggregator;

        public SymbolThemeService(IEventAggregator eventAggregator)
        {
            _eventAggregator = eventAggregator;
        }

        public void ReplaceSymbols(SymbolTheme symbolTheme)
        {
            if (symbolTheme == null)
                throw new ArgumentNullException(nameof(symbolTheme));

            var visuals = symbolTheme.Visuals;

            ReplaceEntry("1", visuals["1"]);
            ReplaceEntry("2", visuals["2"]);
            ReplaceEntry("3", visuals["3"]);
            ReplaceEntry("4", visuals["4"]);
            ReplaceEntry("5", visuals["5"]);
            ReplaceEntry("6", visuals["6"]);
            ReplaceEntry("7", visuals["7"]);
        }

        private void ReplaceEntry(string entryName, object newValue, ResourceDictionary parentDictionary = null)
        {
            if (parentDictionary == null)
                parentDictionary = Application.Current.Resources;

            if (parentDictionary.Contains(entryName))
                if (parentDictionary[entryName] is SolidColorBrush brush && newValue is Color newColor)
                {
                    var animation = new ColorAnimation
                    {
                        From = brush.Color,
                        To = newColor,
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