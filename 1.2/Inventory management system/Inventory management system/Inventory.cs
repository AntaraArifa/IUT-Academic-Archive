using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading.Tasks;

namespace Inventory_management_system
{
    class Inventory
    {
        public List<Product> Products;
        public List<Employee> Employees;

        public Inventory()
        {
            Products = new List<Product>();
            Employees = new List<Employee>();
        }

        public void AddProduct(Product product)
        { 
            Products.Add(product); 
        }

        public void CheckInventory()
        {
            foreach (Product product in Products) 
            {
              
            }
        }

        public void AddSales(double price)
        {
            double Total_sales = 0;
            Total_sales += price;
        }
    }

}
