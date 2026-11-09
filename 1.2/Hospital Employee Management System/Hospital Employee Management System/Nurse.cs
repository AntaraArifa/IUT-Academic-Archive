using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Hospital_Employee_Management_System
{
    public class Nurse : Employee
    {
        public string Position { get; set; }
        public string Department { get; set; }

        public Nurse(string name, string address, string phone, string email, DateTime hireDate, string position, string department)
            : base(name, address, phone, email, hireDate)
        {
            Position = position;
            Department = department;
        }
    }
}
