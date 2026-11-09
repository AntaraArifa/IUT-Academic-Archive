using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Practice
{
    public class Rectangle : IShape
    {
        public double Width { get; set; }
        public double Height { get; set; }

        public Rectangle(double _width, double _height)
        {
            Width = _width;
            Height = _height;
        }

        public double CalculateArea()
        {
            return Width* Height;
        }
    }
}
