using System.Collections.Generic;
using SlotMachineTutorial.Models;

namespace SlotMachineTutorial.Services
{
    public interface ISymbolProvider
    {
        List<SymbolTheme> SymbolThemes { get; }
    }
}