using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace trial_transportation
{





    public class Booking
    {
         
        
            public string Name { get; set; }
            public string Email { get; set; }
            public string Phone { get; set; }
            public string From { get; set; }
            public string To { get; set; }
            public DateTime TravelDate { get; set; }
            public int SeatNumber { get; set; }
            





            public Booking(string name, string email, string phone, string from, string to, DateTime travelDate, int seatNumber)
            {
                Name = name;
                Email = email;
                Phone = phone;
                From = from;
                To = to;
                TravelDate = travelDate;
                SeatNumber = seatNumber;
                
            }





        
    }




}
