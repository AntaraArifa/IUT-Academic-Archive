using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lab_Task_09_02
{
    class Cube : _3DShape
    {
        public double Side { get; set; }

        public Cube(string name, double side) : base(name)
        {
            Side = side;
        }
    }
}
