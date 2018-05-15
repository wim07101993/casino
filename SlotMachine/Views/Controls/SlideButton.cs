using System;
using System.CodeDom;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;

namespace SlotMachine.Views.Controls
{
    [TemplatePart(Name = ThumbPartName, Type = typeof(UIElement))]
    [TemplatePart(Name = TrackPartName, Type = typeof(UIElement))]
    public class SlideButton : Button
    {
        #region DEPENDENCY PROPERTIES

        public static readonly DependencyProperty OrientationProperty = DependencyProperty.Register(
            nameof(Orientation),
            typeof(Orientation),
            typeof(SlideButton),
            new PropertyMetadata(default(Orientation)));

        public static readonly DependencyProperty InvertDirectionProperty = DependencyProperty.Register(
            nameof(InvertDirection),
            typeof(bool),
            typeof(SlideButton),
            new PropertyMetadata(default(bool)));

        public static readonly DependencyProperty SpeedProperty = DependencyProperty.Register(
            nameof(Speed),
            typeof(int),
            typeof(SlideButton),
            new PropertyMetadata(default(int)));

        #endregion DEPENDENCY PROPERTIES


        #region FIELDS

        private const string ThumbPartName = "Thumb";
        private const string TrackPartName = "Track";

        protected FrameworkElement ThumbPart;
        protected FrameworkElement TrackPart;

        private bool _isMoving;

        #endregion FIELDS


        #region CONSTRUCTORS

        static SlideButton()
        {
            DefaultStyleKeyProperty.OverrideMetadata(typeof(SlideButton), new FrameworkPropertyMetadata(typeof(SlideButton)));
        }

        #endregion CONSTRUCTORS


        #region PROPERTIES

        public Orientation Orientation
        {
            get => (Orientation) GetValue(OrientationProperty);
            set => SetValue(OrientationProperty, value);
        }

        public bool InvertDirection
        {
            get => (bool) GetValue(InvertDirectionProperty);
            set => SetValue(InvertDirectionProperty, value);
        }

        public int Speed
        {
            get => (int) GetValue(SpeedProperty);
            set => SetValue(SpeedProperty, value);
        }

        #endregion PROPERTIES

        #region METHODS

        public override void OnApplyTemplate()
        {
            base.OnApplyTemplate();

            ThumbPart = GetTemplateChild(ThumbPartName) as FrameworkElement;
            if (ThumbPart == null)
                throw new Exception($"The element {ThumbPartName} was not found in the template.");

            TrackPart = GetTemplateChild(TrackPartName) as FrameworkElement;
            if (ThumbPart == null)
                throw new Exception($"The element {TrackPartName} was not found in the template.");
        }

        protected override void OnMouseDown(MouseButtonEventArgs e)
        {
            SlideAsync();
            base.OnMouseDown(e);
        }

        private async void SlideAsync()
        {
            if (_isMoving)
                return;

            _isMoving = true;

            switch (Orientation)
            {
                case Orientation.Horizontal:
                    if (InvertDirection)
                    {
                        await SlideLeft();
                        Command.Execute(null);
                        await SlideRight();
                    }
                    else
                    {
                        await SlideRight();
                        Command.Execute(null);
                        await SlideRight();
                    }

                    break;
                case Orientation.Vertical:
                    if (InvertDirection)
                    {
                        await SlideUp();
                        Command.Execute(null);
                        await SlideDown();
                    }
                    else
                    {
                        await SlideDown();
                        Command.Execute(null);
                        await SlideUp();
                    }

                    break;
                default:
                    throw new ArgumentOutOfRangeException();
            }

            _isMoving = false;
        }

        private async Task SlideDown()
        {
        }

        private async Task SlideUp()
        {
        }

        private async Task SlideRight()
        {
        }

        private async Task SlideLeft()
        {
        }

        #endregion METHODS
    }
}