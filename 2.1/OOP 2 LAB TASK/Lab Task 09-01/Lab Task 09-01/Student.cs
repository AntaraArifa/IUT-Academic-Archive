using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lab_Task_09_01
{
    class Student : Person
    {
        public string UniversityName { get; set; }

        public Student(string name, string address, int age, string universityName) : base(name, address, age)
        {
            UniversityName = universityName;
        }

        public void Study()
        {
            Console.WriteLine($"{Name} is studying at {UniversityName}.");
        }
    }
}
