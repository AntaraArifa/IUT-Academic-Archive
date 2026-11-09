using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Hospital_Employee_Management_System
{
    public class Hospital
    {
        public List<Employee> Employees { get; set; }

        public Hospital()
        {
            Employees = new List<Employee>();
        }

        public void AddEmployee(Employee employee)
        {
            Employees.Add(employee);
        }

        public void RemoveEmployee(Employee employee)
        {
            Employees.Remove(employee);
        }

        public List<Employee> ListEmployees()
        {
            return Employees;
        }

    }
}

