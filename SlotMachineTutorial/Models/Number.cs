using System;
using System.Threading.Tasks;
using Prism.Mvvm;

namespace SlotMachineTutorial.Models
{
    public class Number : BindableBase
    {
        #region FIELDS

        private static readonly Random Random = new Random();

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
            await Task.Delay(TimeSpan.FromSeconds(5));
            IsRandomizing = false;
        }

        private async Task SpinNumberAsync()
        {
            while (IsRandomizing)
            {
                Value = Random.Next(1, 8);
                await Task.Delay(10);
            }
        }

        #endregion METHODS
    }
}