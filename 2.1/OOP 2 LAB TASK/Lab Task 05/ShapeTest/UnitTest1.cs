using Lab_Task_05;

namespace ShapeTest
{
    public class Tests
    {
        [SetUp]
        public void Setup()
        {
        }

        [Test]
        public void DrawShapes_Circle_Successful()
        {
            
            Point center = new Point(0, 0);
            Circle circle = new Circle(center, 3);
            List<object> shapes = new List<object> { circle };

            
            Canvas canvas = new Canvas();
            canvas.DrawShapes(shapes);

        }
        [Test]
        public void DrawShapes_Rectangle_Successful()
        {
            
            Point topLeft = new Point(0, 0);
            Rectangle rectangle = new Rectangle(topLeft, 4, 6);
            List<object> shapes = new List<object> { rectangle };

            
            Canvas canvas = new Canvas();
            canvas.DrawShapes(shapes);

            
        }
        [Test]
        public void DrawShapes_Square_Successful()
        {
            
            Point topLeft = new Point(0, 0);
            Square square = new Square(topLeft, 5);
            List<object> shapes = new List<object> { square };

            
            Canvas canvas = new Canvas();
            canvas.DrawShapes(shapes);

            
        }

    }
}