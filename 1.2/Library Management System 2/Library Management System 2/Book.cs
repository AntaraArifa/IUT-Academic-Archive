using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Library_Management_System_2
{
    public class Book : Item<BookDetails>
    {
        public Book(string id, string title, string author, string category, string isbn, int numPages)
            : base(id, title, author, category, new BookDetails(isbn, numPages))
        {
        }

        public override void DisplayDetails()
        {
            base.DisplayDetails();
            Console.WriteLine($"ISBN: {Detail.ISBN}");
            Console.WriteLine($"Number of Pages: {Detail.NumPages}");
        }
    }

    public class BookDetails
    {
        public string ISBN { get; }
        public int NumPages { get; }

        public BookDetails(string isbn, int numPages)
        {
            ISBN = isbn;
            NumPages = numPages;
        }
    }
}
