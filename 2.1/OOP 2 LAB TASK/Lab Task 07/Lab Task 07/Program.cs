using Lab_Task_07;
using System;

namespace Lab_Task_07
{
    class Program
    {
        static void Main(string[] args)
        {
           //Task- 01 and 02
            Employee employee = new Employee();
            employee.GenerateReport();


            //Task-03

            EmployeeController employeeController = new EmployeeController();

            string searchName = "Jane Smith";
            Employee foundEmployee = employeeController.FindEmployeeByName(searchName);
            if (foundEmployee != null)
            {
                Console.WriteLine($"\nEmployee Found: {foundEmployee.Name}");
            }
            else
            {
                Console.WriteLine($"\nEmployee '{searchName}' not found.");
            }

            string updateName = "John Doe";
            bool updated = employeeController.UpdateEmployeeData(updateName, 5500, 1500, "Senior Engineer");
           

            string deleteName = "Bob";
            bool deleted = employeeController.DeleteEmployeeByName(deleteName);
            

            Console.WriteLine("\nAll Employees After Operations:");
            foreach (var Employee in employeeController.GetAllEmployees())
            {
                Console.WriteLine($"Name: {Employee.Name},");
            }
            

            Console.WriteLine("Press any key to exit...");
            Console.ReadKey();

        }
    }
}
