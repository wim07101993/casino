using System.Collections.Generic;
using SlotMachine.Models;

namespace SlotMachine.Services
{
    public interface IColorProvider
    {
        List<ColorTheme> ColorThemes { get; }
    }
}