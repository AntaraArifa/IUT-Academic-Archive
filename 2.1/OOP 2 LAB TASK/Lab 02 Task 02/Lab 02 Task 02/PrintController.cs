using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lab_02_Task_02
{
    internal class PrintController
    {
        private IPrinter printer;

        public PrintController(IPrinter printer)
        {
            this.printer = printer;
        }

        public void PrintDocument(string content)
        {
            printer.Print(content);
        }

        public void PrintColorfulDocument(string content)
        {
            printer.PrintColorful(content);
        }

        public void PrintDuplexDocument(string content)
        {
            printer.PrintDuplex(content);
        }
    }
}
