using System;
using System.Collections.Generic;
using System.Windows.Media;
using SlotMachine.Models;

namespace SlotMachine.Services.Implementations
{
    public class SymbolThemeService : AResourceService, ISymbolThemeService
    {
        public void ReplaceSymbols(SymbolTheme symbolTheme)
        {
            if (symbolTheme == null)
                throw new ArgumentNullException(nameof(symbolTheme));

            var visuals = symbolTheme.Visuals;

            ReplaceEntry("0", visuals["0"]);
            ReplaceEntry("1", visuals["1"]);
            ReplaceEntry("2", visuals["2"]);
            ReplaceEntry("3", visuals["3"]);
            ReplaceEntry("4", visuals["4"]);
            ReplaceEntry("5", visuals["5"]);
            ReplaceEntry("6", visuals["6"]);
        }
    }
}