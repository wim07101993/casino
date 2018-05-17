using System.Windows;
using System.Windows.Controls;
using System.Windows.Media;

namespace SlotMachine.Views.Controls
{
    public class IconCheckBox : CheckBox
    {
        public static readonly DependencyProperty IconProperty = DependencyProperty.Register(
            nameof(Icon),
            typeof(VisualBrush),
            typeof(IconCheckBox),
            new PropertyMetadata(default(VisualBrush)));


        static IconCheckBox()
        {
            DefaultStyleKeyProperty.OverrideMetadata(typeof(IconCheckBox), new FrameworkPropertyMetadata(typeof(IconCheckBox)));
        }


        public VisualBrush Icon
        {
            get => (VisualBrush) GetValue(IconProperty);
            set => SetValue(IconProperty, value);
        }
    }
}