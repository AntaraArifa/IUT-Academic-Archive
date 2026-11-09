using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Practice
{
    public class Circle : IShape
    {
        public double Radius { get; set; }

        public Circle(double _radius)
        {
            this.Radius = _radius;
        }

        public double CalculateArea()
        {
            return Math.PI*Radius*Radius;
        }
    }
}
