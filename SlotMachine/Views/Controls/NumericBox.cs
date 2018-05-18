using System;
using System.Globalization;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;

namespace SlotMachine.Views.Controls
{
    [TemplatePart(Name = ElementTextBox, Type = typeof(TextBox))]
    public class NumericBox : Control
    {
        #region DEPENDENCY PROPERTIES

        public static readonly DependencyProperty TextAlignmentProperty =
            TextBox.TextAlignmentProperty.AddOwner(typeof(NumericBox));

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
            new FrameworkPropertyMetadata(double.MinValue, OnMinimumChanged));

        public static readonly DependencyProperty MaximumProperty = DependencyProperty.Register(
            nameof(Maximum),
            typeof(double),
            typeof(NumericBox),
            new FrameworkPropertyMetadata(double.MaxValue, OnMaximumChanged, CoerceMaximum));

        #endregion DEPENDENCY PROPERTIES

        #region ROUTED EVENTS

        public static readonly RoutedEvent ValueChangedEvent = EventManager.RegisterRoutedEvent("ValueChanged",
            RoutingStrategy.Bubble, typeof(RoutedPropertyChangedEventHandler<double?>), typeof(NumericBox));

        #endregion ROUTED EVENTS


        #region FIELDS

        private const string ElementTextBox = "TextBoxPart";

        private double _intervalMultiplierForCalculation = 1;
        private double _intervalLargeChange = 100;
        private double _intervalValueSinceReset;
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

        public TextAlignment TextAlignment
        {
            get => (TextAlignment) GetValue(TextAlignmentProperty);
            set => SetValue(TextAlignmentProperty, value);
        }

        public double Value
        {
            get => (double) GetValue(ValueProperty);
            set => SetValue(ValueProperty, value);
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

            ResetInterval();
        }

        private void OnValueChanged(double oldValue, double newValue)
        {
            if (newValue <= Minimum || newValue >= Maximum)
                ResetInterval();

            if (_valueTextBox != null)
                _valueTextBox.Text = newValue.ToString(CultureInfo.CurrentCulture);

            if (!Equals(oldValue, newValue))
                RaiseEvent(new RoutedPropertyChangedEventArgs<double>(oldValue, newValue, ValueChangedEvent));
        }

        private void ChangeValueWithSpeedUp(bool toPositive)
        {
            double direction = toPositive ? 1 : -1;
            var d = _intervalLargeChange;
            if ((_intervalValueSinceReset += _intervalMultiplierForCalculation) > d)
            {
                _intervalLargeChange *= 10;
                _intervalMultiplierForCalculation *= 10;
            }

            var increment = direction * _intervalMultiplierForCalculation;
            Value = (double) CoerceValue(this, Value + increment);
        }

        private void ResetInterval()
        {
            _intervalLargeChange = 100;
            _intervalMultiplierForCalculation = 1;
            _intervalValueSinceReset = 0;
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
                    ChangeValueWithSpeedUp(true);
                    break;
                case Key.Down:
                    ChangeValueWithSpeedUp(false);
                    break;
            }
        }

        protected override void OnPreviewKeyUp(KeyEventArgs e)
        {
            base.OnPreviewKeyUp(e);

            switch (e.Key)
            {
                case Key.Down:
                case Key.Up:
                    ResetInterval();
                    break;
            }
        }

        protected override void OnPreviewMouseWheel(MouseWheelEventArgs e)
        {
            base.OnPreviewMouseWheel(e);

            var increment = e.Delta > 0 ? 1 : -1;
            Value = (double) CoerceValue(this, Value + increment);
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
            var minimum = ((NumericBox) d).Minimum;
            var val = (double) value;
            return val < minimum ? minimum : val;
        }

        private static object CoerceValue(DependencyObject d, object value)
        {
            if (!(value is double dValue))
                return 0;

            var numericBox = (NumericBox) d;
            dValue = Math.Truncate(dValue);

            if (dValue < numericBox.Minimum)
                return numericBox.Minimum;

            if (dValue > numericBox.Maximum)
                return numericBox.Maximum;

            return dValue;
        }

        private static void OnMaximumChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
        {
            d.CoerceValue(ValueProperty);
        }

        private static void OnMinimumChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
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