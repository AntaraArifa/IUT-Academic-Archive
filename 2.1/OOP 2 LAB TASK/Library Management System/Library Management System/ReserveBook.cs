using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Library_Management_System
{
    public class ReserveBook : IReservable
    {
        private BookState bookState;

        public ReserveBook(BookState bookState)
        {
            this.bookState = bookState;
        }

        public bool IsReserved => bookState.IsReserved;

        public void ReserveItem()
        {
            if (!IsReserved)
            {
                bookState.IsReserved = true;
                Console.WriteLine("Item reserved successfully.");
            }
            else
            {
                Console.WriteLine("Item cannot be reserved.");
            }
        }

        public void CancelReservation()
        {
            if (IsReserved)
            {
                bookState.IsReserved = false;
                Console.WriteLine("Reservation canceled.");
            }
            else
            {
                throw new InvalidOperationException("Item is not currently reserved.");
            }
        }
    }


}
