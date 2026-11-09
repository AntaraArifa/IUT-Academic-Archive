using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Hospital_Employee_Management_System
{
    public abstract class Employee
    {
        public string Name { get; set; }
        public string Address { get; set; }
        public string Phone { get; set; }
        public string Email { get; set; }
        public DateTime HireDate { get; set; }

        public Employee(string name, string address, string phone, string email, DateTime hireDate)
        {
            Name = name;
            Address = address;
            Phone = phone;
            Email = email;
            HireDate = hireDate;
        }

        public int Showdetails()
        {
            return (DateTime.Now - HireDate).Days / 365;
        }

        public int CalculateYearsOfService()
        {
            return (DateTime.Now - HireDate).Days / 365;
        }

    }
}

