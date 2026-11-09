using Lab_Task_02_aggregation;
using System;

class Program
{
    static void Main(string[] args)
    {
        Employee employee = new Employee { Name = "Antara", Id = "132" };

        Department department = new Department();
        department.AddEmployee(employee);

        employee.Work();
        
    }
}

