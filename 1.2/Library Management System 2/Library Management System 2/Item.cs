using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Library_Management_System_2
{
    public abstract class Item<T>
    {
        public string Id { get; set; }
        public string Title { get; set; }
        public string Author { get; set; }
        public string Category { get; set; }
        public bool IsAvailable { get; set; }
        public T Detail { get; set; }

        public Item(string id, string title, string author, string category, T detail)
        {
            Id = id;
            Title = title;
            Author = author;
            Category = category;
            IsAvailable = true;
            Detail = detail;
        }
        public virtual void DisplayDetails()
        {
            Console.WriteLine($"ID: {Id}");
            Console.WriteLine($"Title: {Title}");
            Console.WriteLine($"Author: {Author}");
            Console.WriteLine($"Category: {Category}");
            Console.WriteLine($"Is Available: {IsAvailable}");
        }
        public virtual void BorrowItem()
        {
            IsAvailable = false;
        }
        public virtual void ReturnItem()
        {
            IsAvailable = true;
        }
    }
}
 
