using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace homework_task
{
    public class Bottles
    {
        void BottlesOfBeer()
        {
            for (int bottles = 99; bottles >= 0; bottles--)
            {
                switch (bottles)
                {
                    case 0:
                        Console.WriteLine("No more bottles of beer on the wall, no more bottles of beer.");
                        Console.WriteLine("Go to the store and buy some more, 99 bottles of beer on the wall.");
                        break;
                    case 1:
                        Console.WriteLine("1 bottle of beer on the wall, 1 bottle of beer.");
                        Console.WriteLine("Take it down and pass it around, no more bottles of beer on the wall.");
                        break;
                    default:
                        Console.WriteLine($"{bottles} bottles of beer on the wall, {bottles} bottles of beer.");
                        Console.WriteLine($"Take one down and pass it around, {bottles - 1} bottles of beer on the wall.");
                        break;
                }
                Console.WriteLine();
            }
        }

        public static void Main(string[] args)
        {
            Console.WriteLine("hello");
        }
    }
}
