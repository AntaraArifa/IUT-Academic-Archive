using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lab_Task_02
{
    internal class Teacher
    {
        public void Teach(Student student)
        {
            Console.WriteLine("Teacher is teaching.");
            student.Learn();
        }

    }
}
