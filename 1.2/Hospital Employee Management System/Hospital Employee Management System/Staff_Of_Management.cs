using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Hospital_Employee_Management_System
{
    public class StaffOfManagement : Employee
    {
        public string Department { get; set; }
        public string Position { get; set; }

        public StaffOfManagement(string name, string address, string phone, string email, DateTime hireDate, string department, string position)
            : base(name, address, phone, email, hireDate)
        {
            Department = department;
            Position = position;
        }
    }
}
