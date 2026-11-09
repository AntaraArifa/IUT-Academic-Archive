using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lab_02_Task_02
{
    internal class CanonPrinter : IPrinter
    {
        public void Print(string content)
        {
            Console.WriteLine($"Canon Printer: Printing colorful - {content}");
        }

        public void PrintColorful(string content)
        {
            Console.WriteLine($"Canon Printer: Printing colorful - {content}");
        }

        public void PrintDuplex(string content)
        {
            Console.WriteLine($"Canon Printer: Printing duplex - {content}");
        }
    }
}
