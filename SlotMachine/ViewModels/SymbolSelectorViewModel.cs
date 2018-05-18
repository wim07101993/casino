using System.Collections.Generic;
using System.Linq;
using Prism.Mvvm;
using SlotMachine.Helpers.Extensions;
using SlotMachine.Models;
using SlotMachine.Services;
using SlotMachine.ViewModelInerfaces;

namespace SlotMachine.ViewModels
{
  public  class SymbolSelectorViewModel : BindableBase, ISymbolSelectorViewModel
    {
        private readonly ISymbolThemeService _symbolThemeService;

        public SymbolSelectorViewModel(ISymbolProvider symbolProvider, ISymbolThemeService symbolThemeService)
        {
            _symbolThemeService = symbolThemeService;
            Symbols = symbolProvider.SymbolThemes;
        }


        public List<SymbolTheme> Symbols { get; }
        
        public SymbolTheme SelectedSymbols
        {
            set => ChangeSymbols(value);
        }
        
        public void ChangeSymbols(SymbolTheme symbolTheme)
        {
            if (symbolTheme == null)
                return;
            _symbolThemeService.ReplaceSymbols(symbolTheme);
        }
    }
}
