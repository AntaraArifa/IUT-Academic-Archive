using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Delegation_Good_Example
{
    internal class Plane : ITicket
    {
        private int flightNumber;
        private int availableSeats;

        public Plane(int flightNumber, int availableSeats)
        {
            this.flightNumber = flightNumber;
            this.availableSeats = availableSeats;
        }

        public bool BookTicket(Passenger passenger)
        {
            if (availableSeats > 0)
            {
                availableSeats--;
                Console.WriteLine($"Ticket booked for passenger {passenger.GetName()} on flight {flightNumber}");
                return true;
            }
            else
            {
                Console.WriteLine($"No available seats on flight {flightNumber}");
                return false;
            }
        }
    }
}
