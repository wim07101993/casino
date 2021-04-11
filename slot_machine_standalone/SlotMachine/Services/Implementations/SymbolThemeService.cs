using System;
using Prism.Events;
using SlotMachine.Helpers.PubSubEvents;
using SlotMachine.Models;

namespace SlotMachine.Services.Implementations
{
    public class SymbolThemeService : AResourceService, ISymbolThemeService
    {
        private readonly IEventAggregator _eventAggregator;

        public SymbolThemeService(IEventAggregator eventAggregator)
        {
            _eventAggregator = eventAggregator;
        }

        public void ReplaceSymbols(SymbolTheme symbolTheme)
        {
            if (symbolTheme == null)
                throw new ArgumentNullException(nameof(symbolTheme));

            var visuals = symbolTheme.Visuals;

            ReplaceEntry("1", visuals["1"]);
            ReplaceEntry("2", visuals["2"]);
            ReplaceEntry("3", visuals["3"]);
            ReplaceEntry("4", visuals["4"]);
            ReplaceEntry("5", visuals["5"]);
            ReplaceEntry("6", visuals["6"]);
            ReplaceEntry("7", visuals["7"]);

            _eventAggregator
                .GetEvent<SymbolsChangedEvent>()
                .Publish(symbolTheme);
        }
    }
}