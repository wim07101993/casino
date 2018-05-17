using System.Collections.Generic;
using System.Windows;
using System.Windows.Input;
using System.Windows.Media;
using Prism.Commands;
using SlotMachine.Models;
using SlotMachine.Services;
using SlotMachine.ViewModelInerfaces;

namespace SlotMachine.ViewModels
{
    public class ColorSelectorViewModel: IColorSelectorViewModel
    {
        public ColorSelectorViewModel(IColorProvider colorProvider)
        {
            ChangeAccentColorCommand = new DelegateCommand<IDictionary<string, Color>>(ChangeAccentColor);
            ChangePrimaryColorCommand = new DelegateCommand<IDictionary<string, Color>>(ChangePrimaryColor);

            Colors = colorProvider.ColorThemes;
        }


        public List<ColorTheme> Colors { get; }
        public ICommand ChangeAccentColorCommand { get; }
        public ICommand ChangePrimaryColorCommand { get; }


        public void ChangeAccentColor(IDictionary<string, Color> colors)
        {
            MessageBox.Show("Change accent color");
        }

        public void ChangePrimaryColor(IDictionary<string, Color> colors)
        {
            MessageBox.Show("Change primary color");
        }
    }
}
