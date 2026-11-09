using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Inventory_management_system
{
    abstract class Employee
    {
        public string Name { get; set; }
        public double Base_salary { get; set; }

        public abstract double Calculate_Bonus(double sale_price);
    }

    class SalesAssociate : Employee
    {
        public double Total_sales { get; set; }

        public override double Calculate_Bonus(double sale_price )
        {
            double bonus = sale_price * 0.01 * Total_sales;
            Total_sales = 0;
            return bonus;
        }
    }

    class Manager : Employee
    {

    }
}
