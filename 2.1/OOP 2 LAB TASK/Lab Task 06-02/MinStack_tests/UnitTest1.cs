using Lab_Task_06_02;

namespace MinStack_tests
{
    public class Tests
    {

        [Test]
        public void TestCase1()
        {
            // Arrange
            MinStack stack1 = new MinStack();

            // Act
            stack1.Push(3);
            stack1.Push(2);
            stack1.Push(5);
            stack1.Push(1);

            // Assert
            Assert.True(stack1.Min() == 1);

        }


        [Test]
        public void TestCase2()
        {
            // Arrange
            MinStack stack2 = new MinStack();

            // Act
            stack2.Push(3);
            stack2.Push(2);
            stack2.Push(5);
            stack2.Push(1);
            stack2.Pop();

            // Assert

            Assert.AreEqual(2, stack2.Min());
        }



        [Test]
        public void TestCase3()
        {
            // Arrange
            MinStack stack3 = new MinStack();

            // Act
            stack3.Push(12);
            stack3.Push(3);
            stack3.Push(4);

            Assert.True(stack3.Min() == 3);
        }

    }
}