using System;
using System.Collections;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Reflection;
using System.Resources;
using System.Text.RegularExpressions;
using System.Windows;
using System.Windows.Media;
using SlotMachineTutorial.Models;
using SlotMachineTutorial.Helpers.Extensions;
using SlotMachineTutorial.Services;

namespace SlotMachineTutorials.Services.Implementations
{
    public class SymbolProvider : ISymbolProvider
    {
        public SymbolProvider()
        {
            SymbolThemes = FetchSymbolThemes();
        }


        public List<SymbolTheme> SymbolThemes { get; }


        private static ResourceDictionary Read(string assemblyName, string path)
        {
            if (assemblyName == null || path == null)
                return null;

            return (ResourceDictionary)Application.LoadComponent(new Uri(
                $"/{assemblyName};component/{path.Replace(".baml", ".xaml")}",
                UriKind.RelativeOrAbsolute));
        }

        private static List<SymbolTheme> FetchSymbolThemes()
        {
            var assembly = Assembly.GetExecutingAssembly();
            var assemblyName = assembly.GetName().Name;
            var resourcesName = $"{assemblyName}.g";

            var manager = new ResourceManager(resourcesName, assembly);
            var resourceSet = manager.GetResourceSet(CultureInfo.CurrentCulture, true, true);
            var dictionaryEntries = resourceSet.OfType<DictionaryEntry>().ToList();

            var regex = new Regex(@"^views\/icons\/symbols\/(?<name>[a-z]+)\.baml");

            return dictionaryEntries.Select(x =>
                {
                    var key = x.Key.ToString();
                    return new { Key = key, Match = regex.Match(key) };
                })
                .Where(x => x.Match.Success)
                .Select(x => new SymbolTheme()
                {
                    Name = x.Key,
                    Visuals = Read(assemblyName, x.Key)?.ToDictionary<Visual>(),
                })
                .ToList();
        }
    }
}
