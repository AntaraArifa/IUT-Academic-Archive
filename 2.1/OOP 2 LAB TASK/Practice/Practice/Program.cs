using System;
using Practice;
using System.Collections.Generic;

namespace Practice
{
    class Program
    {
        static void Main(string[] args)
        {
            IShape circle = new Circle(5.0);
            IShape rectangle = new Rectangle(4.0, 6.0);

            double circleArea = circle.CalculateArea();
            double rectangleArea = rectangle.CalculateArea();

            Console.WriteLine($"Circle Area: {circleArea}");
            Console.WriteLine($"Rectangle Area: {rectangleArea}");

            Console.ReadKey();
           
        }
    }
}
