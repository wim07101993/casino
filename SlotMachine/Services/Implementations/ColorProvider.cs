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
            var colorThemes = new List<ColorTheme>();

            foreach (var entry in dictionaryEntries)
            {
                var key = entry.Key.ToString();
                var match = regex.Match(key);
                if (!match.Success)
                    continue;

                ResourceDictionary primaryDictionary = null;
                ResourceDictionary accentsDictionary = null;
                switch (match.Groups["type"].Value)
                {
                    case "primary":
                        primaryDictionary = Read(assemblyName, key);
                        break;
                    case "accent":
                        accentsDictionary = Read(assemblyName, key);
                        break;
                }

                var primaryColors = primaryDictionary?.ToDictionary<Color>();
                var accentColors = accentsDictionary?.ToDictionary<Color>();

                colorThemes.Add(new ColorTheme
                {
                    Name = match.Groups["name"].Value,
                    AccentColors = accentColors,
                    PrimaryColors = primaryColors,
                });
            }

            return colorThemes;
        }
    }
}