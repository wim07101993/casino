using Windows.UI.Xaml;

namespace SlotMachine.UWP.Helpers
{
    public static class ApplicationExtensions
    {
        public static object TryFindResource(this Application This, object key)
            => This.Resources.TryFindResource(key);
    }
}