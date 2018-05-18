using System.Collections.Generic;
using System.Collections.ObjectModel;

namespace SlotMachine.Helpers.Extensions
{
    public static class EnumerableExtensions
    {
        public static ObservableCollection<T> ToObservableCollection<T>(this IEnumerable<T> This)
            => new ObservableCollection<T>(This);
    }
}