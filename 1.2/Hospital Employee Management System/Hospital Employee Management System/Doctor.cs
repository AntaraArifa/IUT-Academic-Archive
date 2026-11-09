using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Hospital_Employee_Management_System
{
    public class Doctor : Employee
    {
        public string Department { get; set; }
        public string Position { get; set; }
        public List<string> Degrees { get; set; }
        public List<Doctor> Doctors { get; set; }

        public Doctor(string name, string address, string phone, string email, DateTime hireDate, string department, string position, List<string> degrees, List<Doctor> doctors)
            : base(name, address, phone, email, hireDate)
        {
            Department = department;
            Position = position;
            Degrees = degrees;
            Doctors = doctors;
        }
    }
}
