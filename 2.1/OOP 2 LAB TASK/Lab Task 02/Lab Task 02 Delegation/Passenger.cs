using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lab_Task_02_Delegation
{
    internal class Passenger
    {
        private string name;

        public Passenger(string name)
        {
            this.name = name;
        }

        public string GetName()
        {
            return name;
        }

        public void BookTicketForTravel(string mode)
        {
            if (mode == "train")
            {
                Train train = new Train();
                train.BookTicket(this);
            }
            else if (mode == "plane")
            {
                Plane plane = new Plane();
                plane.BookTicket(this);
            }
            else
            {
                Console.WriteLine("Invalid travel mode");
            }
        }
    }
}
