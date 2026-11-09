using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lab_Task_09_01
{
    public class Person
    {
        public string Name { get; set; }
        public string Address { get; set; }
        public int Age { get; set; }

        public Person(string name, string address, int age)
        {
            Name = name;
            Address = address;
            Age = age;
        }
    }
}
