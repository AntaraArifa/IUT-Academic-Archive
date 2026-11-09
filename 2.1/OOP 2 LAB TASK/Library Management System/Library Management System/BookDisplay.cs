using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Library_Management_System
{
    public class BookDisplay
    {
        private BookState bookState;

        public BookDisplay(BookState bookState)
        {
            this.bookState = bookState;
        }

        public string Display()
        {
            string borrowingStatus = bookState.IsBorrowed ? "Borrowed" : "Available";
            string reservationStatus = bookState.IsReserved ? "Reserved" : "Not Reserved";

            return $"Title: {bookState.Title}, Author: {bookState.Author}, Borrowing Status: {borrowingStatus}, Reservation Status: {reservationStatus}";
        }
    }

}

