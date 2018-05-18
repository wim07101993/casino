using System.Windows;
using System.Windows.Controls.Primitives;
using System.Windows.Media;

namespace SlotMachine.Views.Controls
{
    public class IconToggleButton : ToggleButton
    {
        public static readonly DependencyProperty IconProperty = DependencyProperty.Register(
            nameof(Icon),
            typeof(VisualBrush),
            typeof(IconToggleButton),
            new PropertyMetadata(default(VisualBrush)));


        static IconToggleButton()
        {
            DefaultStyleKeyProperty.OverrideMetadata(typeof(IconToggleButton), new FrameworkPropertyMetadata(typeof(IconToggleButton)));
        }


        public VisualBrush Icon
        {
            get => (VisualBrush) GetValue(IconProperty);
            set => SetValue(IconProperty, value);
        }
    }
}