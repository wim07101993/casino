using System.Windows;
using System.Windows.Controls;

namespace SlotMachine.Views.Controls
{
    public class Drawer : ContentControl 
    {
        #region DEPENDENCY PROPERTIES

        public static readonly DependencyProperty IsOpenProperty = DependencyProperty.Register(
            nameof(IsOpen),
            typeof(bool),
            typeof(Drawer),
            new PropertyMetadata(default(bool)));

        public static readonly DependencyProperty DrawerDepthProperty = DependencyProperty.Register(
            nameof(DrawerDepth),
            typeof(double),
            typeof(Drawer),
            new PropertyMetadata(default(double)));

        #endregion DEPENDENCY PROPERTIES


        #region CONSTRUCTORS

        static Drawer()
        {
            DefaultStyleKeyProperty.OverrideMetadata(typeof(Drawer), new FrameworkPropertyMetadata(typeof(Drawer)));
        }

        #endregion CONSTRUCTORS


        #region PROPERTIES

        public bool IsOpen
        {
            get => (bool) GetValue(IsOpenProperty);
            set => SetValue(IsOpenProperty, value);
        }

        public double DrawerDepth
        {
            get => (double) GetValue(DrawerDepthProperty);
            set => SetValue(DrawerDepthProperty, value);
        }

        #endregion PROPERTIES
    }
}