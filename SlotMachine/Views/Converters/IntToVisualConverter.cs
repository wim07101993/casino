using System;
using System.Globalization;
using System.Windows;
using System.Windows.Data;

namespace SlotMachine.Views.Converters
{
    public class IntToVisualConverter : IValueConverter
    {
        private static readonly ResourceDictionary ResourceDictionary = new ResourceDictionary
        {
            Source = new Uri("pack://application:,,,/SlotMachine;component/Views/Icons/Symbols/Classic.xaml")
        };


        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
        {
            if (value == null)
                return null;

            var symbols = ResourceDictionary[value.ToString()];
            return symbols;
        }

        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
        {
            throw new NotImplementedException();
        }
    }
}