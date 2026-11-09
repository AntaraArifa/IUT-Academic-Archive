using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Library_Management_System
{
    public class BookState
    {
        public string Title { get; set; }
        public string Author { get; set; }
        public bool IsBorrowed { get; set; }
        public bool IsReserved { get; set; }

        public string Display()
        {
            string borrowingStatus = IsBorrowed ? "Borrowed" : "Available";
            string reservationStatus = IsReserved ? "Reserved" : "Not Reserved";

            return $"Title: {Title}, Author: {Author}, Borrowing Status: {borrowingStatus}, Reservation Status: {reservationStatus}";
        }
    }


}
