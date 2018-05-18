using System;
using System.Globalization;
using System.Windows;
using System.Windows.Data;

namespace SlotMachine.Views.Converters
{
    public class IntToVisualConverter : IValueConverter
    {
        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
            => value == null
                ? null
                : Application.Current.TryFindResource(value.ToString());

        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture) 
            => throw new NotImplementedException();
    }
}