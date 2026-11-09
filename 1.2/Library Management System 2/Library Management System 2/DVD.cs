using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Library_Management_System_2
{
    public class DVD : Item<DVDDetails>
    {
        public DVD(string id, string title, string author, string category, string director, int length)
            : base(id, title, author, category, new DVDDetails(director, length))
        {
        }

        public override void DisplayDetails()
        {
            base.DisplayDetails();
            Console.WriteLine($"Director: {Detail.Director}");
            Console.WriteLine($"Length: {Detail.Length} minutes");
        }
    }

    public class DVDDetails
    {
        public string Director { get; }
        public int Length { get; }

        public DVDDetails(string director, int length)
        {
            Director = director;
            Length = length;
        }
    }
}

