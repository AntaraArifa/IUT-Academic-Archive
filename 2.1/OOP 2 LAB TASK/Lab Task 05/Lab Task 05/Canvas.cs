using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lab_Task_05
{
    public class Canvas
    {
        public void DrawShapes(List<object> shapes)
        {
            foreach (var shape in shapes)
            {
                if (shape is Circle)
                {
                    Circle circle = (Circle)shape;
                    Console.WriteLine($"Drawing Circle with Area: {circle.CalculateArea()}");
                }
                else if (shape is Rectangle)
                {
                    Rectangle rectangle = (Rectangle)shape;
                    Console.WriteLine($"Drawing Rectangle with Area: {rectangle.CalculateArea()}");
                }
                else if (shape is Square)
                {
                    Square square = (Square)shape;
                    Console.WriteLine($"Drawing Square with Area: {square.CalculateArea()}");
                }
                else
                {
                    throw new ArgumentException("Unsupported shape type");
                }
            }
        }
    }
}
