using System;
using System.Linq;
using Windows.UI.Xaml;
using Windows.UI.Xaml.Data;
using SlotMachine.UWP.Helpers;

namespace SlotMachine.UWP.Views.Converters
{
    public class IntToResourceConverter : IValueConverter
    {
        public object Convert(object value, Type targetType, object parameter, string language)
            => value == null
                ? null
                : Application.Current.TryFindResource(value.ToString());

        

        public object ConvertBack(object value, Type targetType, object parameter, string language)
            => value == null
                ? null
                : Application
                    .Current
                    .Resources
                    .FirstOrDefault(x => x.Value == value)
                    .Key;
    }
}