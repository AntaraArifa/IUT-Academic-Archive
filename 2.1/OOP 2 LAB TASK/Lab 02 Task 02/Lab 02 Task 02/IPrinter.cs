using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lab_02_Task_02
{
    internal interface IPrinter
    {
        void Print(string content);
        void PrintColorful(string content);
        void PrintDuplex(string content);
    }
}
