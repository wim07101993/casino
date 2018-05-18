using System.Collections.Generic;
using System.Windows.Media;
using Prism.Mvvm;

namespace SlotMachine.Models
{
    public class SymbolTheme : BindableBase
    {
        private Dictionary<string, Visual> _visuals;
        private string _name;


        public string Name
        {
            get => _name;
            set => SetProperty(ref _name, value);
        }

        public Dictionary<string, Visual> Visuals
        {
            get => _visuals;
            set => SetProperty(ref _visuals, value);
        }

        public Visual Zero => Visuals["0"];
        public Visual One => Visuals["1"];
        public Visual Two => Visuals["2"];
        public Visual Three => Visuals["3"];
        public Visual Four => Visuals["4"];
        public Visual Five => Visuals["5"];
        public Visual Six => Visuals["6"];
    }
}