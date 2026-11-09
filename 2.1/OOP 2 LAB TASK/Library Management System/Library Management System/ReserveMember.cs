using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Library_Management_System
{

    public class ReserveMember : LibraryMember
    {
        public void ReserveItem(BookState item, IReservable service)
        {
            try
            {
                service.ReserveItem(); 
                Console.WriteLine($"{MemberName} reserved {item.Display()}");
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error during reservation: {ex.Message}");
                
            }
        }

        public void CancelReservation(BookState item, IReservable service)
        {
            try
            {
                service.CancelReservation();
                Console.WriteLine($"{MemberName}'s reservation for {item.Display()} ");
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error during reservation cancellation: {ex.Message}");
                
            }
        }

        public override void AddMember(LibraryMember member)
        {
            
            Console.WriteLine($"Reserve Member {member.MemberName} added.");
        }
    }


}
