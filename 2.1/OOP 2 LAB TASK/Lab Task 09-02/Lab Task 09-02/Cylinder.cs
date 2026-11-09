using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lab_Task_09_02
{
    class Cylinder : _3DShape
    {
        public double Radius { get; set; }
        public double Height { get; set; }

        public Cylinder(string name, double radius, double height) : base(name)
        {
            Radius = radius;
            Height = height;
        }
    }
}
