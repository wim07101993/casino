using System;
using System.Windows;
using System.Windows.Media;
using System.Windows.Media.Animation;

namespace SlotMachine.Services
{
    public abstract class AResourceService
    {
        protected void ReplaceEntry(string entryName, object newValue, ResourceDictionary parentDictionary = null)
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