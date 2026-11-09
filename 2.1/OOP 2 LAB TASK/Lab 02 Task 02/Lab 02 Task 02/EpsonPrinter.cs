using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lab_02_Task_02
{
    internal class EpsonPrinter : IPrinter
    {
        public void Print(string content)
        {
            Console.WriteLine($"Epson Printer: Printing black and white - {content}");
        }

        public void PrintColorful(string content)
        {
            Console.WriteLine($"Epson Printer: Printing colorful - {content}");
        }

        public void PrintDuplex(string content)
        {
            Console.WriteLine($"Epson Printer: Printing duplex - {content}");
        }
    }
}
