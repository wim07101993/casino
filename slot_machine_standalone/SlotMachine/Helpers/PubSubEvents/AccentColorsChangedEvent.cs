using Prism.Events;
using SlotMachine.Models;

namespace SlotMachine.Helpers.PubSubEvents
{
    public class AccentColorsChangedEvent : PubSubEvent<ColorTheme>
    {
    }
}