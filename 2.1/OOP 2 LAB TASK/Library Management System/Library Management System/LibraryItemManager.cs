using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Library_Management_System
{
    public class LibraryItemManager
    {
        private List<BookState> items;

        public LibraryItemManager()
        {
            items = new List<BookState>();
        }

        public void AddItem(BookState item)
        {
            items.Add(item);
        }

        public void DisplayItems()
        {
            foreach (BookState item in items)
            {
                string borrowingStatus = item.IsBorrowed ? "Borrowed" : "Available";
                string reservationStatus = item.IsReserved ? "Reserved" : "Not Reserved";

                Console.WriteLine($"Title: {item.Title}, Author: {item.Author}, Borrowing Status: {borrowingStatus}, Reservation Status: {reservationStatus}");
            }
        }


        public BookState GetItem(string title)
        {
            return items.Find(item => item.Title == title);
        }
    }
}
