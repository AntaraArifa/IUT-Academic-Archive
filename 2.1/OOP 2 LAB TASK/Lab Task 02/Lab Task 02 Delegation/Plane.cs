using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lab_Task_02_Delegation
{
    internal class Plane
    {
        public void BookTicket(Passenger passenger)
        {
            Console.WriteLine($"Plane ticket booked for {passenger.GetName()}");
        }
    }
}
