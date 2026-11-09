using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Delegation_Good_Example
{
    internal class BookingManagement
    {
        public static void BookTicket(ITicket ticket, Passenger passenger)
        {
            ticket.BookTicket(passenger);
        }
    }
}
