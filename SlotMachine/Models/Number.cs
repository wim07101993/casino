using System;
using System.Threading.Tasks;
using Prism.Mvvm;

namespace SlotMachine.Models
{
    public class Number : BindableBase
    {
        #region FIELDS

        private static readonly Random Random = new Random();

        public static int MinValue = 0;
        public static int MaxValue = 6;

        public static int MinSpinTime = 3000;
        public static int MaxSpinTime = 6000;

        private int _value;
        private bool _isRandomizing;

        #endregion FIELDS


        #region PROPERTIES

        public int Value
        {
            get => _value;
            set => SetProperty(ref _value, value);
        }

        public bool IsRandomizing
        {
            get => _isRandomizing;
            private set => SetProperty(ref _isRandomizing, value);
        }

        #endregion PROPERTIES


        #region METHODS

        public void Randomize()
        {
            IsRandomizing = true;
            ResetIsRandomizingAsync();
            SpinNumberAsync();
        }

        private async void ResetIsRandomizingAsync()
        {
            var spinTime = Random.Next(MinSpinTime, MaxSpinTime);
            await Task.Delay(spinTime);
            IsRandomizing = false;
        }

        private async void SpinNumberAsync()
        {
            while (IsRandomizing)
            {
                Value = Random.Next(MinValue, MaxValue);
                await Task.Delay(10);
            }
        }

        #endregion METHODS
    }
}