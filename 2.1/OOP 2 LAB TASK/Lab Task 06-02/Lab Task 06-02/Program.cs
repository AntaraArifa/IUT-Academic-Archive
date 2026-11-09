using Lab_Task_06_02;
using System;

namespace MinStackConsoleApp
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Testing MinStack...");

            MinStack minStack = new MinStack();

            minStack.Push(3);
            minStack.Push(1);
            minStack.Push(4);
            minStack.Push(2);

            int min = minStack.Min();
            Console.WriteLine("Minimum value in the stack: " + min);

            minStack.Pop();
            minStack.Pop();

            min = minStack.Min();
            Console.WriteLine("Minimum value in the stack after popping: " + min);

            Console.WriteLine("Press any key to exit...");
            Console.ReadKey();
        }
    }
}
