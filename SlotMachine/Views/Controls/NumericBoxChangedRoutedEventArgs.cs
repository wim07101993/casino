using System.Windows;

namespace SlotMachine.Views.Controls
{
    public class NumericBoxChangedRoutedEventArgs : RoutedEventArgs
    {
        public double Interval { get; set; }

        public NumericBoxChangedRoutedEventArgs(RoutedEvent routedEvent, double interval) : base(routedEvent)
        {
            Interval = interval;
        }
    }
}