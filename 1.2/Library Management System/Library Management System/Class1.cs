using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Library_Management_System
{
    internal class Class1
    {
       public int id;
       public string title;
       public string author;
       public string publisher;
       public int quantity;

        public Class1(int id, string title, string author, string publisher, int quantity)
        {
            this.id = id;
            this.title = title;
            this.author = author;
            this.publisher = publisher;
            this.quantity = quantity;
        }
    }
}
