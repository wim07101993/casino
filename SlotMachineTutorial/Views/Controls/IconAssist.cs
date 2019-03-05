using System.Windows;
using System.Windows.Media;

namespace SlotMachineTutorial.Views.Controls
{
    public static class IconAssist
    {
        public static readonly DependencyProperty IconProperty = DependencyProperty.RegisterAttached(
            "Icon",
            typeof(Visual), 
            typeof(IconAssist),
            new PropertyMetadata(default(Visual)));

        public static void SetIcon(DependencyObject element, object value) => element.SetValue(IconProperty, value);

        public static Visual GetIcon(DependencyObject element) => (Visual) element.GetValue(IconProperty);
    }
}
