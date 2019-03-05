using System.Collections;
using System.Collections.Generic;
using System.Windows;

namespace SlotMachineTutorial.Helpers.Extensions
{
    public static class ResourceDictionaryExtensions
    {
        public static Dictionary<string, T> ToDictionary<T>(this ResourceDictionary This)
        {
            var ret = new Dictionary<string, T>();

            foreach (DictionaryEntry entry in This)
                ret.Add(entry.Key.ToString(), (T) entry.Value);

            return ret;
        }
    }
}