using Lab_Task_05;

class Program
{
    static void Main()
    {
        Point point = new Point(0, 0);
        Circle circle = new Circle(point, 3);
        Rectangle rectangle = new Rectangle(point, 4, 6);
        Square square = new Square(point, 5);

        List<object> shapes = new List<object> { circle, rectangle, square };

        Canvas canvas = new Canvas();
        canvas.DrawShapes(shapes);
    }


}