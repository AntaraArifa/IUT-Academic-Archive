using Lab_Task_06_01;

namespace FizzBuzzTests
{
    public class Tests
    {
        [SetUp]
        public void Setup()
        {
        }
        [Test]
        public void TestDivisibleBy3()
        {
            FizzBuzz fizzBuzz = new FizzBuzz();
            string result = fizzBuzz.GetFizzyBuzz(9);
            Assert.AreEqual("Fizz", result);
        }


        [Test]
        public void TestDivisibleBy7()
        {
            FizzBuzz fizzBuzz = new FizzBuzz();
            string result = fizzBuzz.GetFizzyBuzz(14);
            Assert.AreEqual("Buzz", result);
        }


        [Test]
        public void TestDivisibleBy3And7()
        {
            FizzBuzz fizzBuzz = new FizzBuzz();
            string result = fizzBuzz.GetFizzyBuzz(21);
            Assert.AreEqual("FizzBuzz", result);
        }



        [Test]
        public void TestNotDivisibleBy3Or7()
        {
            FizzBuzz fizzBuzz = new FizzBuzz();
            string result = fizzBuzz.GetFizzyBuzz(8);
            Assert.AreEqual("Gotcha", result);
        }
    }
}