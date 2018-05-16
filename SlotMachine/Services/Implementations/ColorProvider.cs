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
using SlotMachine.Helpers.Extensions;
using SlotMachine.Models;

namespace SlotMachine.Services.Implementations
{
    public class ColorProvider : IColorProvider
    {
        public ColorProvider()
        {
            ColorThemes = FetchColorThemes();
        }

        public List<ColorTheme> ColorThemes { get; }


        private static ResourceDictionary Read(string assemblyName, string path)
        {
            if (assemblyName == null || path == null)
                return null;

            return (ResourceDictionary) Application.LoadComponent(new Uri(
                $"/{assemblyName};component/{path.Replace(".baml", ".xaml")}",
                UriKind.RelativeOrAbsolute));
        }

        private static List<ColorTheme> FetchColorThemes()
        {
            var assembly = Assembly.GetExecutingAssembly();
            var assemblyName = assembly.GetName().Name;
            var resourcesName = $"{assemblyName}.g";

            var manager = new ResourceManager(resourcesName, assembly);
            var resourceSet = manager.GetResourceSet(CultureInfo.CurrentCulture, true, true);
            var dictionaryEntries = resourceSet.OfType<DictionaryEntry>().ToList();

            var regex = new Regex(@"^views\/colors\/(?<name>[a-z]+)\.(?<type>primary|accent)\.baml");
            
            return dictionaryEntries.Select(x =>
                {
                    var key = x.Key.ToString();
                    return new {Key = key, Match = regex.Match(key)};
                })
                .Where(x => x.Match.Success)
                .GroupBy(x => x.Match.Groups["name"].Value)
                .Select(x =>
                {
                    var primaryPath = x.SingleOrDefault(y => y.Match.Groups["type"].Value == "primary")?.Key;
                    var accentPath = x.SingleOrDefault(y => y.Match.Groups["type"].Value == "accent")?.Key;

                    return new ColorTheme
                    {
                        Name = x.Key,
                        AccentColors = Read(assemblyName, accentPath)?.ToDictionary<Color>(),
                        PrimaryColors = Read(assemblyName, primaryPath)?.ToDictionary<Color>()
                    };
                })
                .ToList();
        }
    }
}