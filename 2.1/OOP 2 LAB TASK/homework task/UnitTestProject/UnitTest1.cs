using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;
using System.IO;

namespace UnitTestProject
{
    [TestClass]
    public class UnitTest1
    {
        private UnitTest1 _program;

        [TestInitialize]
        public void Setup()
        {
            _program = new UnitTest1();
        }

        [TestMethod]
        public void TestMethod1()
        {
          
            string expectedOutput = "89 bottles of beer on the wall, 89 bottles of beer.\n" +
                                    "Take one down and pass it around, 88 bottles of beer on the wall.\n";

           
            using (StringWriter sw = new StringWriter())
            {
                Console.SetOut(sw);
                _program.BottlesOfBeer(89);
                string actualOutput = sw.ToString().Trim();


                Assert.AreEqual(expectedOutput, actualOutput);
            }
        }
    }
}
