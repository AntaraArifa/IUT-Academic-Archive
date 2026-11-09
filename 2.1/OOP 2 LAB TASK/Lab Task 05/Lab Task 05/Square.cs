using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lab_Task_05
{
    public class Square
    {
        public Point TopLeft { get; set; }
        public int SideLength { get; set; }

        public Square(Point topLeft, int sideLength)
        {
            TopLeft = topLeft;
            SideLength = sideLength;
        }

        public double CalculateArea()
        {
            return Math.Pow(SideLength, 2);
        }
    }

}
