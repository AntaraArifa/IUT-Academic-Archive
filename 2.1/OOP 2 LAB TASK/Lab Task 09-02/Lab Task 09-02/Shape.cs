using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lab_Task_09_02
{
    public class Shape
    {
        public string Name { get; set; }

        public Shape(string name)
        {
            Name = name;
        }
    }

    class _2DShape : Shape
    {
        public _2DShape(string name) : base(name) { }
    }

    class _3DShape : Shape
    {
        public _3DShape(string name) : base(name) { }
    }
}
