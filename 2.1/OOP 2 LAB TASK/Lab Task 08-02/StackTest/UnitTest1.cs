using Lab_Task_08_02;

namespace StackTest
{
    public class Tests
    {
        [SetUp]
        public void Setup()
        {
        }

        [Test]
        public void TestMinMaxStackMin()
        {
            MinMaxStack<int> minStack = new MinMaxStack<int>("min");

            minStack.Push(3);
            minStack.Push(2);
            minStack.Push(5);

            int min = minStack.Aggregate();
            Assert.AreEqual(2, min);
        }

        [Test]
        public void TestMinMaxStackMax()
        {
            MinMaxStack<int> maxStack = new MinMaxStack<int>("max");

            maxStack.Push(3);
            maxStack.Push(2);
            maxStack.Push(5);

            int max = maxStack.Aggregate();
            Assert.AreEqual(5, max);
        }
    }
}