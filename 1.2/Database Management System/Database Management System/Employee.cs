using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Database_Management_System
{
    public class Employee
    {
        public string Name { get; set; }
        public int EmployeeID { get; set; }
        public string JobTitle { get; set; }
        public decimal Salary { get; set; }

        public virtual void ViewSalary()
        {
            Console.WriteLine("Salary: " + Salary);
        }

        public virtual void CalculateSalaryIncrease()
        {
            Salary *= 1.1M;
        }

        public virtual void PerformPerformanceReview()
        {
           
        }
    }
}
