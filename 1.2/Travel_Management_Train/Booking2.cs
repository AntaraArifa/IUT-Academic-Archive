using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace trial_transportation
{
    public class Booking2
    {

        public string Name { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public string From { get; set; }
        public string To { get; set; }
        public DateTime TravelDate { get; set; }
        public string SeatClass { get; set; }






        public Booking2(string name, string email, string phone, string from, string to, DateTime travelDate, string seatClass)
        {
            Name = name;
            Email = email;
            Phone = phone;
            From = from;
            To = to;
            TravelDate = travelDate;
            SeatClass = seatClass;

        }


    }
}
