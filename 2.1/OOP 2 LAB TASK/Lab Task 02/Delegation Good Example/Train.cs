using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Delegation_Good_Example
{
    internal class Train : ITicket
    {
        private int trainNumber;
        private int availableSeats;

        public Train(int trainNumber, int availableSeats)
        {
            this.trainNumber = trainNumber;
            this.availableSeats = availableSeats;
        }

        public bool BookTicket(Passenger passenger)
        {
            if (availableSeats > 0)
            {
                availableSeats--;
                Console.WriteLine($"Ticket booked for passenger {passenger.GetName()} on train {trainNumber}");
                return true;
            }
            else
            {
                Console.WriteLine($"No available seats on train {trainNumber}");
                return false;
            }
        }
    }
}
