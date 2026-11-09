using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace trial_transportation
{
    public class Booking3
    {

        public string Name { get; set; }
        public string Email { get; set; }
        public string Contact { get; set; }
        public string From { get; set; }
        public string To { get; set; }

        public DateTime TravelDate { get; set; }
        public string SeatNumber { get; set; }
        public string SeatClass { get; set; }

        public Booking3(string name, string email, string phone, string from, string to, DateTime travelDate, string seatNumber, string seatclass)
        {
            Name = name;
            Email = email;
            Contact = phone;
            From = from;
            To = to;
            TravelDate = travelDate;
            SeatNumber = seatNumber;
            SeatClass = seatclass;

        }



    }
}
