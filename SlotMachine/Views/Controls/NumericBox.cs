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
            typeof(double?),
            typeof(NumericBox),
            new FrameworkPropertyMetadata(default(double?), FrameworkPropertyMetadataOptions.BindsTwoWayByDefault,
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

        public static readonly RoutedEvent ValueIncrementedEvent = EventManager.RegisterRoutedEvent("ValueIncremented",
            RoutingStrategy.Bubble, typeof(NumericBoxChangedRoutedEventHandler), typeof(NumericBox));

        public static readonly RoutedEvent ValueDecrementedEvent = EventManager.RegisterRoutedEvent("ValueDecremented",
            RoutingStrategy.Bubble, typeof(NumericBoxChangedRoutedEventHandler), typeof(NumericBox));

        public static readonly RoutedEvent DelayChangedEvent = EventManager.RegisterRoutedEvent("DelayChanged",
            RoutingStrategy.Bubble, typeof(RoutedEventHandler), typeof(NumericBox));

        public static readonly RoutedEvent MaximumReachedEvent = EventManager.RegisterRoutedEvent("MaximumReached",
            RoutingStrategy.Bubble, typeof(RoutedEventHandler), typeof(NumericBox));

        public static readonly RoutedEvent MinimumReachedEvent = EventManager.RegisterRoutedEvent("MinimumReached",
            RoutingStrategy.Bubble, typeof(RoutedEventHandler), typeof(NumericBox));

        public static readonly RoutedEvent ValueChangedEvent = EventManager.RegisterRoutedEvent("ValueChanged",
            RoutingStrategy.Bubble, typeof(RoutedPropertyChangedEventHandler<double?>), typeof(NumericBox));

        #endregion ROUTED EVENTS


        #region FIELDS

        private const double DefaultInterval = 1d;
        private const string ElementTextBox = "TextBoxPart";
        private const string ScientificNotationChar = "E";

        private readonly Tuple<string, string> _removeFromText = new Tuple<string, string>(string.Empty, string.Empty);

        private double _interval = 1;
        private double _intervalMultiplierForCalculation = DefaultInterval;
        private double _intervalLargeChange = DefaultInterval * 100;
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

        public double? Value
        {
            get => (double?) GetValue(ValueProperty);
            set => SetValue(ValueProperty, value);
        }

        #endregion PROPERTIES

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

            OnValueChanged(Value, Value);
        }
        
        protected override void OnPreviewKeyDown(KeyEventArgs e)
        {
            base.OnPreviewKeyDown(e);

            switch (e.Key)
            {
                case Key.Up:
                    ChangeValueWithSpeedUp(true);
                    InternalSetText(Value);
                    break;
                case Key.Down:
                    ChangeValueWithSpeedUp(false);
                    InternalSetText(Value);
                    break;
            }
        }

        protected override void OnPreviewKeyUp(KeyEventArgs e)
        {
            base.OnPreviewKeyUp(e);

            if (e.Key == Key.Down ||
                e.Key == Key.Up)
                ResetInterval();
        }

        protected override void OnPreviewMouseWheel(MouseWheelEventArgs e)
        {
            base.OnPreviewMouseWheel(e);

            if (!IsFocused && !_valueTextBox.IsFocused)
                return;

            var increment = e.Delta > 0;
            ChangeValueInternal(increment);
        }

        private static void OnPreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            e.Handled = true;
            if (string.IsNullOrWhiteSpace(e.Text) ||
                e.Text.Length != 1)
                return;

            var text = e.Text;
            if (char.IsDigit(text[0]))
                e.Handled = false;
            else
            {
                var equivalentCulture = CultureInfo.CurrentCulture;
                var numberFormatInfo = equivalentCulture.NumberFormat;
                var textBox = (TextBox) sender;
                var allTextSelected = textBox.SelectedText == textBox.Text;

                if (numberFormatInfo.NumberDecimalSeparator == text)
                    return;

                if (numberFormatInfo.NegativeSign == text ||
                    text == numberFormatInfo.PositiveSign)
                {
                    if (textBox.SelectionStart == 0)
                    {
                        if (textBox.Text.Length > 1)
                        {
                            if (allTextSelected ||
                                !textBox.Text.StartsWith(numberFormatInfo.NegativeSign,
                                    StringComparison.CurrentCultureIgnoreCase) &&
                                !textBox.Text.StartsWith(numberFormatInfo.PositiveSign,
                                    StringComparison.CurrentCultureIgnoreCase))
                                e.Handled = false;
                        }
                        else
                            e.Handled = false;
                    }
                    else if (textBox.SelectionStart > 0)
                    {
                        var elementBeforeCaret = textBox.Text
                            .ElementAt(textBox.SelectionStart - 1)
                            .ToString(equivalentCulture);

                        if (elementBeforeCaret.Equals(ScientificNotationChar,
                            StringComparison.CurrentCultureIgnoreCase))
                            e.Handled = false;
                    }
                }
                else if (text.Equals(ScientificNotationChar, StringComparison.CurrentCultureIgnoreCase) &&
                         textBox.SelectionStart > 0 &&
                         !textBox.Text.Any(i =>
                             i.ToString(equivalentCulture).Equals(ScientificNotationChar,
                                 StringComparison.CurrentCultureIgnoreCase)))
                    e.Handled = false;
            }
        }
        
        private void OnValueChanged(double? oldValue, double? newValue)
        {
            if (!newValue.HasValue)
            {
                if (_valueTextBox != null)
                    _valueTextBox.Text = null;

                if (oldValue != null)
                    RaiseEvent(new RoutedPropertyChangedEventArgs<double?>(oldValue, null, ValueChangedEvent));

                return;
            }

            if (newValue <= Minimum)
            {
                ResetInterval();

                if (IsLoaded)
                    RaiseEvent(new RoutedEventArgs(MinimumReachedEvent));
            }

            if (newValue >= Maximum)
            {
                ResetInterval();
                if (IsLoaded)
                    RaiseEvent(new RoutedEventArgs(MaximumReachedEvent));
            }

            if (_valueTextBox != null)
                InternalSetText(newValue);

            if (oldValue != null && !Equals(oldValue, newValue))
                RaiseEvent(new RoutedPropertyChangedEventArgs<double?>(oldValue, newValue, ValueChangedEvent));
        }

        private void InternalSetText(double? newValue)
        {
            if (!newValue.HasValue)
            {
                _valueTextBox.Text = null;
                return;
            }

            _valueTextBox.Text = newValue.Value.ToString(CultureInfo.CurrentCulture);
        }

        private void ChangeValueWithSpeedUp(bool toPositive)
        {
            double direction = toPositive ? 1 : -1;
            var d = _interval * _intervalLargeChange;
            if ((_intervalValueSinceReset += _interval * _intervalMultiplierForCalculation) > d)
            {
                _intervalLargeChange *= 10;
                _intervalMultiplierForCalculation *= 10;
            }

            ChangeValueInternal(direction * _intervalMultiplierForCalculation);
        }

        private void ChangeValueInternal(bool addInterval)
        {
            ChangeValueInternal(addInterval ? _interval : -_interval);
        }

        private void ChangeValueInternal(double interval)
        {
            var routedEvent = interval > 0
                ? new NumericBoxChangedRoutedEventArgs(ValueIncrementedEvent, interval)
                : new NumericBoxChangedRoutedEventArgs(ValueDecrementedEvent, interval);

            RaiseEvent(routedEvent);

            if (!routedEvent.Handled)
            {
                ChangeValueBy(routedEvent.Interval);
                _valueTextBox.CaretIndex = _valueTextBox.Text.Length;
            }
        }

        private void ChangeValueBy(double difference)
        {
            var newValue = Value.GetValueOrDefault() + difference;
            Value = (double) CoerceValue(this, newValue);
        }

        private void ResetInterval()
        {
            _intervalLargeChange = 100 * _interval;
            _intervalMultiplierForCalculation = _interval;
            _intervalValueSinceReset = 0;
        }

        private bool ValidateText(string text, out double convertedValue)
        {
            if (!string.IsNullOrEmpty(_removeFromText.Item1))
                text = text.Replace(_removeFromText.Item1, string.Empty);

            if (!string.IsNullOrEmpty(_removeFromText.Item2))
                text = text.Replace(_removeFromText.Item2, string.Empty);

            return double.TryParse(text, NumberStyles.Any, CultureInfo.CurrentCulture, out convertedValue);
        }

        #region TEXT BOX EVENT HANDLERS

        private void OnTextBoxLostFocus(object sender, RoutedEventArgs e)
        {
            var tb = (TextBox) sender;

            if (ValidateText(tb.Text, out var convertedValue))
            {
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
            else
                OnValueChanged(Value, Value);
        }

        private void OnTextChanged(object sender, TextChangedEventArgs e)
        {
            if (string.IsNullOrEmpty(((TextBox) sender).Text))
                Value = null;
            else if (ValidateText(((TextBox) sender).Text, out var convertedValue))
            {
                Value = (double?) CoerceValue(this, convertedValue);
                e.Handled = true;
            }
        }

        private void OnValueTextBoxPaste(object sender, DataObjectPastingEventArgs e)
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

        #endregion TEXT BOX EVENT HANDLERS

        #region DEPENDENCY PROPERTY CALLBACK

        private static object CoerceMaximum(DependencyObject d, object value)
        {
            var minimum = ((NumericBox) d).Minimum;
            var val = (double) value;
            return val < minimum ? minimum : val;
        }

        private static object CoerceValue(DependencyObject d, object value)
        {
            if (value == null)
                return null;

            var numericBox = (NumericBox) d;
            var val = ((double?) value).Value;
            val = Math.Truncate(val);

            if (val < numericBox.Minimum)
                return numericBox.Minimum;

            if (val > numericBox.Maximum)
                return numericBox.Maximum;

            return val;
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
            ((NumericBox)d).OnValueChanged((double?) e.OldValue, (double?) e.NewValue);
        }

        #endregion DEPENDENCY PROPERTY CALLBACK

        #region EVENTS

        public event RoutedPropertyChangedEventHandler<double?> ValueChanged
        {
            add => AddHandler(ValueChangedEvent, value);
            remove => RemoveHandler(ValueChangedEvent, value);
        }

        public event NumericBoxChangedRoutedEventHandler ValueIncremented
        {
            add => AddHandler(ValueIncrementedEvent, value);
            remove => RemoveHandler(ValueIncrementedEvent, value);
        }

        public event NumericBoxChangedRoutedEventHandler ValueDecremented
        {
            add => AddHandler(ValueDecrementedEvent, value);
            remove => RemoveHandler(ValueDecrementedEvent, value);
        }

        #endregion EVENTS
    }
}