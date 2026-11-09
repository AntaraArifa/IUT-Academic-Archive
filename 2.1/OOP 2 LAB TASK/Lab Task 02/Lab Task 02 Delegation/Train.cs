using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lab_Task_02_Delegation
{
    internal class Train
    {
        public void BookTicket(Passenger passenger)
        {
            Console.WriteLine($"Train ticket booked for {passenger.GetName()}");
        }
    }
}
