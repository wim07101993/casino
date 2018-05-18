using System;
using System.Globalization;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;

namespace SlotMachine.Views.Controls
{
    [TemplatePart(Name = ElementTextBox, Type = typeof(TextBox))]
    public class NumericBox : Control
    {
        #region DEPENDENCY PROPERTIES
        
        public static readonly DependencyProperty ValueProperty = DependencyProperty.Register(
            nameof(Value),
            typeof(double),
            typeof(NumericBox),
            new FrameworkPropertyMetadata(default(double), FrameworkPropertyMetadataOptions.BindsTwoWayByDefault,
                OnValueChanged, CoerceValue));

        public static readonly DependencyProperty MinimumProperty = DependencyProperty.Register(
            nameof(Minimum),
            typeof(double),
            typeof(NumericBox),
            new FrameworkPropertyMetadata(double.MinValue, OnBoundryChanged));

        public static readonly DependencyProperty MaximumProperty = DependencyProperty.Register(
            nameof(Maximum),
            typeof(double),
            typeof(NumericBox),
            new FrameworkPropertyMetadata(double.MaxValue, OnBoundryChanged, CoerceMaximum));

        public static readonly DependencyProperty HintProperty = DependencyProperty.Register(
            nameof(Hint), 
            typeof(string),
            typeof(NumericBox),
            new PropertyMetadata(default(string)));

        #endregion DEPENDENCY PROPERTIES


        #region ROUTED EVENTS

        public static readonly RoutedEvent ValueChangedEvent = EventManager.RegisterRoutedEvent(
            nameof(ValueChanged),
            RoutingStrategy.Bubble,
            typeof(RoutedPropertyChangedEventHandler<double>),
            typeof(NumericBox));

        #endregion ROUTED EVENTS


        #region FIELDS

        private const string ElementTextBox = "TextBoxPart";
        private TextBox _valueTextBox;

        #endregion FIELDS


        #region CONSTRUCTORS

        static NumericBox()
        {
            DefaultStyleKeyProperty.OverrideMetadata(typeof(NumericBox),
                new FrameworkPropertyMetadata(typeof(NumericBox)));

            VerticalContentAlignmentProperty.OverrideMetadata(typeof(NumericBox),
                new FrameworkPropertyMetadata(VerticalAlignment.Center));
            HorizontalContentAlignmentProperty.OverrideMetadata(typeof(NumericBox),
                new FrameworkPropertyMetadata(HorizontalAlignment.Right));
        }

        #endregion CONSTRUCTORS


        #region PROPERTIES

        public double Maximum
        {
            get => (double) GetValue(MaximumProperty);
            set => SetValue(MaximumProperty, value);
        }

        public double Minimum
        {
            get => (double) GetValue(MinimumProperty);
            set => SetValue(MinimumProperty, value);
        }
        
        public double Value
        {
            get => (double) GetValue(ValueProperty);
            set => SetValue(ValueProperty, value);
        }

        public string Hint
        {
            get => (string)GetValue(HintProperty);
            set => SetValue(HintProperty, value);
        }

        #endregion PROPERTIES


        #region METHODS

        public override void OnApplyTemplate()
        {
            base.OnApplyTemplate();

            _valueTextBox = GetTemplateChild(ElementTextBox) as TextBox;

            if (_valueTextBox == null)
                throw new InvalidOperationException($@"Element {ElementTextBox} not found");

            _valueTextBox.LostFocus += OnTextBoxLostFocus;
            _valueTextBox.PreviewTextInput += OnPreviewTextInput;
            _valueTextBox.TextChanged += OnTextChanged;

            DataObject.AddPastingHandler(_valueTextBox, OnValueTextBoxPaste);
        }

        private void OnValueChanged(double oldValue, double newValue)
        {
            if (_valueTextBox != null)
                _valueTextBox.Text = newValue.ToString(CultureInfo.CurrentCulture);

            if (!Equals(oldValue, newValue))
                RaiseEvent(new RoutedPropertyChangedEventArgs<double>(oldValue, newValue, ValueChangedEvent));
        }

        private static bool ValidateText(string text, out double convertedValue)
            => double.TryParse(text, NumberStyles.Any, CultureInfo.CurrentCulture, out convertedValue);

        #region keyboard and mouse increment/decrement

        protected override void OnPreviewKeyDown(KeyEventArgs e)
        {
            base.OnPreviewKeyDown(e);

            switch (e.Key)
            {
                case Key.Up:
                    Value++;
                    break;
                case Key.Down:
                    Value--;
                    break;
            }
        }

        protected override void OnPreviewMouseWheel(MouseWheelEventArgs e)
        {
            base.OnPreviewMouseWheel(e);

            var increment = e.Delta > 0 ? 1 : -1;
            SetValue(ValueProperty, CoerceValue(this, Value + increment));
        }

        private static void OnPreviewTextInput(object sender, TextCompositionEventArgs e)
            => e.Handled = string.IsNullOrWhiteSpace(e.Text) || e.Text.Length != 1 || !char.IsDigit(e.Text[0]);

        #endregion keyboard and mouse increment/decrement

        #region text box event handlers

        private void OnTextBoxLostFocus(object sender, RoutedEventArgs e)
        {
            if (!ValidateText(((TextBox) sender).Text, out var convertedValue))
            {
                OnValueChanged(Value, Value);
                return;
            }

            if (Equals(Value, convertedValue))
                OnValueChanged(Value, Value);

            if (convertedValue > Maximum)
            {
                if (Equals(Value, Maximum))
                    OnValueChanged(Value, Value);
                else
                    SetValue(ValueProperty, Maximum);
            }
            else if (convertedValue < Minimum)
            {
                if (Equals(Value, Minimum))
                    OnValueChanged(Value, Value);
                else
                    SetValue(ValueProperty, Minimum);
            }
            else
                SetValue(ValueProperty, convertedValue);
        }

        private void OnTextChanged(object sender, TextChangedEventArgs e)
        {
            if (string.IsNullOrEmpty(((TextBox) sender).Text))
                Value = 0;
            else if (ValidateText(((TextBox) sender).Text, out var convertedValue))
            {
                Value = (double) CoerceValue(this, convertedValue);
                e.Handled = true;
            }
        }

        private static void OnValueTextBoxPaste(object sender, DataObjectPastingEventArgs e)
        {
            var textBox = (TextBox) sender;
            var textPresent = textBox.Text;

            var isText = e.SourceDataObject.GetDataPresent(DataFormats.Text, true);
            if (!isText)
                return;

            var text = e.SourceDataObject.GetData(DataFormats.Text) as string;

            var newText = string.Concat(
                textPresent.Substring(0, textBox.SelectionStart),
                text,
                textPresent.Substring(textBox.SelectionStart + textBox.SelectionLength));

            if (!ValidateText(newText, out var _))
                e.CancelCommand();
        }

        # endregion text box event handlers

        #region dependency property callbacks

        private static object CoerceMaximum(DependencyObject d, object value)
        {
            var minimum = (double) d.GetValue(MinimumProperty);
            return (double)value < minimum 
                ? minimum 
                : value;
        }

        private static object CoerceValue(DependencyObject d, object value)
        {
            if (!(value is double dValue))
                return 0;

            dValue = Math.Truncate(dValue);

            var minimum = (double)d.GetValue(MinimumProperty);
            if (dValue < minimum)
                return minimum;

            var maximum = (double)d.GetValue(MaximumProperty);
            if (dValue > maximum)
                return maximum;

            return value;
        }

        private static void OnBoundryChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
        {
            d.CoerceValue(MaximumProperty);
            d.CoerceValue(ValueProperty);
        }
        
        private static void OnValueChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
        {
            ((NumericBox) d).OnValueChanged((double) e.OldValue, (double) e.NewValue);
        }

        #endregion dependency property callbacks

        #endregion METHODS


        #region EVENTS

        public event RoutedPropertyChangedEventHandler<double> ValueChanged
        {
            add => AddHandler(ValueChangedEvent, value);
            remove => RemoveHandler(ValueChangedEvent, value);
        }

        #endregion EVENTS
    }
}