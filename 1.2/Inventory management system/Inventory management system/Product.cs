using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Inventory_management_system
{
    class Product
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public double Price { get; set; }
        public int Inventory_level { get; set; }
        public int Min_inv_lvl { get; set; }
        public int Requisition_amount { get; set; }
    }

     public void IncreaseInventory(int quantity)
    {
        int Inventory_level = 0;
        Inventory_level += quantity;
    }

    public void NeedRequisition(int amount)
    {
            if (Inventory_level < Min_inv_lvl)
            {
                Inventory_level += amount;
            }
           
    }


}
