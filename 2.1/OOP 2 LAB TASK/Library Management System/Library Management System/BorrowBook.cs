using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Library_Management_System
{
    public class BorrowBook : IBorrowable
    {
        private BookState bookState;

        public BorrowBook(BookState bookState)
        {
            this.bookState = bookState;
        }

        public bool IsBorrowed => bookState.IsBorrowed;

        public void BorrowItem()
        {
            if (!IsBorrowed)
            {
                bookState.IsBorrowed = true;
                Console.WriteLine("Item borrowed successfully.");
            }
            else
            {
                Console.WriteLine("Item is not available for borrowing.");
            }
        }

        public void ReturnItem()
        {
            if (IsBorrowed)
            {
                bookState.IsBorrowed = false;
                Console.WriteLine("Item returned successfully.");
            }
            else
            {
                throw new InvalidOperationException("Item is not currently borrowed.");
            }
        }
    }


}
