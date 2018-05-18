using System.Collections.Generic;
using SlotMachine.Models;

namespace SlotMachine.ViewModelInerfaces
{
    public interface ISymbolSelectorViewModel
    {
        List<SymbolTheme> Symbols { get; }
        SymbolTheme SelectedSymbols { set; }
    }
}