using System;
using System.Collections.Generic;

namespace Lab_Task_09_02
{
    class Program
    {
        static void Main(string[] args)
        {
            // Assignment Statements

            Node<_2DShape> _2DShapeNode = new Node<_2DShape>(new _2DShape("2D Shape"));
            Node<Triangle> triangleNode = new Node<Triangle>(new Triangle("Triangle", 4.0, 3.0));
            Node<Circle> circleNode = new Node<Circle>(new Circle("Circle", 5.0));
            Node<_3DShape> _3DShapeNode = new Node<_3DShape>(new _3DShape("3D Shape"));
            Node<Cube> cubeNode = new Node<Cube>(new Cube("Cube", 3.0));




            // Validity Explanation:

            // - _2DShapeNode can hold _2DShape or its derived types.
            // - circleNode can hold Circle or its derived types.
            // - cubeNode can hold Cube or its derived types.
            // - triangleNode can hold Triangle or its derived types.
            // - _3DShapeNode can hold _3DShape or its derived types.

            // Output information about the nodes and shapes

            Console.WriteLine("2D Shape Node: " + _2DShapeNode.Data.Name);
            Console.WriteLine("Triangle Node: " + triangleNode.Data.Name + ", Base: " + triangleNode.Data.Base + ", Height: " + triangleNode.Data.Height);
            Console.WriteLine("Circle Node: " + circleNode.Data.Name + ", Radius: " + circleNode.Data.Radius);
            Console.WriteLine("3D Shape Node: " + _3DShapeNode.Data.Name);
            Console.WriteLine("Cube Node: " + cubeNode.Data.Name + ", Side: " + cubeNode.Data.Side);
        }
    }
}
  