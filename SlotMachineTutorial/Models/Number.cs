using System;
using System.Threading.Tasks;
using Prism.Mvvm;

namespace SlotMachineTutorial.Models
{
    public class Number : BindableBase
    {
        #region FIELDS

        private static readonly Random Random = new Random();

        public static int MinValue = 1;
        public static int MaxValue = 7;

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

        public async Task RandomizeAsync()
        {
            IsRandomizing = true;
            var _ = ResetIsRandomizingAsync();
            await SpinNumberAsync();
        }

        private async Task ResetIsRandomizingAsync()
        {
            var spinTime = Random.Next(MinSpinTime, MaxSpinTime);
            await Task.Delay(spinTime);
            IsRandomizing = false;
        }

        private async Task SpinNumberAsync()
        {
            while (IsRandomizing)
            {
                Value = Random.Next(MinValue, MaxValue + 1);
                await Task.Delay(10);
            }
        }

        #endregion METHODS
    }
}