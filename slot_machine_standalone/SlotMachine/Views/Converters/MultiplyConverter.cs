using System;
using System.Globalization;
using System.Windows.Data;

namespace SlotMachine.Views.Converters
{
    public class MultiplyConverter : IMultiValueConverter
    {
        public object Convert(object[] values, Type targetType, object parameter, CultureInfo culture)
        {
            var result = 1.0;
            foreach (var value in values)
                if (value is double d)
                    result *= d;

            return result;
        }

        public object[] ConvertBack(object value, Type[] targetTypes, object parameter, CultureInfo culture)
        {
            throw new NotImplementedException();
        }
    }
}
