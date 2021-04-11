using System.Collections.Generic;
using SlotMachine.Models;

namespace SlotMachine.Services
{
    public interface ISymbolProvider
    {
        List<SymbolTheme> SymbolThemes { get; }
    }
}