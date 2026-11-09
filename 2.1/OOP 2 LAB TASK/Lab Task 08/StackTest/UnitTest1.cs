using Lab_Task_08;

namespace StackTest
{
    public class Tests
    {
        [SetUp]
        public void Setup()
        {
        }

        [Test]
        public void TestIntegerStack()
        {
            var intStack = new GenericMaxStack<int>();
            intStack.Push(3);
            intStack.Push(5);
            intStack.Push(2);
            Assert.AreEqual(5, intStack.Max());
        }

        [Test]
        public void TestIntegerStack2()
        {
            var intStack = new GenericMaxStack<int>();
            intStack.Push(2);
            intStack.Push(1);
            intStack.Push(2);
            intStack.Push(5);
            intStack.Pop();
            Assert.AreEqual(2, intStack.Max());
            intStack.Pop();
            Assert.AreEqual(2, intStack.Max());
        }

        [Test]
        public void TestDoubleStack()
        {
            var doubleStack = new GenericMaxStack<double>();
            doubleStack.Push(49.75);
            doubleStack.Push(23.54);
            doubleStack.Push(100.0);
            Assert.AreEqual(100.0, doubleStack.Max());
            doubleStack.Pop();
            Assert.AreEqual(49.75, doubleStack.Max());
        }

        [Test]
        public void TestStringStack()
        {
            var stringStack = new GenericMaxStack<string>();
            stringStack.Push("OOC is bad");
            stringStack.Push("Nothing to understand");
            stringStack.Push("Try hard");
            Assert.AreEqual("Try hard", stringStack.Max());
            stringStack.Pop();
            Assert.AreEqual("OOC is bad", stringStack.Max());
        }
    }
}