using System;
using System.Windows.Media;

namespace SlotMachine.Helpers.Extensions
{
    public static class ColorExtensions
    {
        public static float GetHue(this Color This)
        {
            if (This.R == This.G && This.G == This.B)
                return 0.0f;

            var num1 = This.R / (float) byte.MaxValue;
            var num2 = This.G / (float) byte.MaxValue;
            var num3 = This.B / (float) byte.MaxValue;
            var num4 = 0.0f;
            var num5 = num1;
            var num6 = num1;

            if (num2 > (double) num5)
                num5 = num2;
            if (num3 > (double) num5)
                num5 = num3;
            if (num2 < (double) num6)
                num6 = num2;
            if (num3 < (double) num6)
                num6 = num3;
            var num7 = num5 - num6;

            if (Math.Abs(num1 - (double) num5) < 0.0001)
                num4 = (num2 - num3) / num7;
            else if (Math.Abs(num2 - (double) num5) < 0.0001)
                num4 = (float) (2.0 + (num3 - (double) num1) / num7);
            else if (Math.Abs(num3 - (double) num5) < 0.0001)
                num4 = (float) (4.0 + (num1 - (double) num2) / num7);

            var num8 = num4 * 60f;
            if (num8 < 0.0)
                num8 += 360f;

            return num8;
        }
    }
}