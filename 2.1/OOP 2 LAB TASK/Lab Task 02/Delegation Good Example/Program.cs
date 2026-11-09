using Delegation_Good_Example;

class Program
{
    static void Main(string[] args)
    {
        Passenger passenger1 = new Passenger(1, "Alice");
        Passenger passenger2 = new Passenger(2, "Bob");

        Train train = new Train(123, 50);
        Plane plane = new Plane(456, 100);

        BookingManagement.BookTicket(train, passenger1);
        BookingManagement.BookTicket(plane, passenger2);
    }
}
