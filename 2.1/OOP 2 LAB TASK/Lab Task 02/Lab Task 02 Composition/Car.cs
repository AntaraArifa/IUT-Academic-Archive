using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lab_Task_02_Composition
{
    internal class Car
    {
        private Engine engine;
        private Wheel[] wheels;

        public Car()
        {
            engine = new Engine();
            wheels = new Wheel[4];

            for (int i = 0; i < 4; i++)
            {
                wheels[i] = new Wheel();
            }
        }
    }
}
