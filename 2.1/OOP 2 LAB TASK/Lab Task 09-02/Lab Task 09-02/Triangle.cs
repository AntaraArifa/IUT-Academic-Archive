using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lab_Task_09_02
{
    class Triangle : _2DShape
    {
        public double Base { get; set; }
        public double Height { get; set; }

        public Triangle(string name, double _base, double height) : base(name)
        {
            Base = _base;
            Height = height;
        }
    }
}
