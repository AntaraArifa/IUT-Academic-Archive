using Lab_Task_06_01;
using System;

namespace FizzBuzzConsoleApp
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Welcome to FizzBuzz!");

            FizzBuzz fizzBuzz = new FizzBuzz();

            Console.Write("Enter a number: ");
            if (int.TryParse(Console.ReadLine(), out int number))
            {
                string result = fizzBuzz.GetFizzyBuzz(number);
                Console.WriteLine("Result: " + result);
            }
            else
            {
                Console.WriteLine("Invalid input. Please enter a valid number.");
            }

            Console.WriteLine("Press any key to exit...");
            Console.ReadKey();
        }
    }
}
