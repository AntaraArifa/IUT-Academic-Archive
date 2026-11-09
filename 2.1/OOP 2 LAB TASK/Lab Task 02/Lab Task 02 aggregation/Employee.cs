using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lab_Task_02_aggregation
{
    internal class Employee
    {
        public string Name { get; set; }
        public string Id { get; set; }

        public void Work()
        {
            Console.WriteLine("Doing my job");
        }
    }
}
