using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lab_Task_05
{
    public class Rectangle
    {
        public Point TopLeft { get; set; }
        public int Length { get; set; }
        public int Width { get; set; }

        public Rectangle(Point topLeft, int length, int width)
        {
            TopLeft = topLeft;
            Length = length;
            Width = width;
        }

        public double CalculateArea()
        {
            return Length * Width;
        }
    }
}
