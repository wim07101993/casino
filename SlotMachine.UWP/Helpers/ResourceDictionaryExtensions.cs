using System.Linq;
using Windows.UI.Xaml;

namespace SlotMachine.UWP.Helpers
{
    public static class ResourceDictionaryExtensions
    {
        public static object TryFindResource(this ResourceDictionary This, object key)
        {
            var ret = This
                .FirstOrDefault(x => x.Key.Equals(key))
                .Value;

            if (ret != null)
                return ret;

            foreach (var subDictionary in This.MergedDictionaries)
            {
                ret = subDictionary.TryFindResource(key);
                if (ret != null)
                    return ret;
            }

            return null;
        }
    }
}