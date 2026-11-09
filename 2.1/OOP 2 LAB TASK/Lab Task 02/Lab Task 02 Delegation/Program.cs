using Lab_Task_02_Delegation;

class Program
{
    static void Main(string[] args)
    {
        Passenger passenger1 = new Passenger("Alice");
        Passenger passenger2 = new Passenger("Bob");

        passenger1.BookTicketForTravel("train");
        passenger2.BookTicketForTravel("plane");
        passenger1.BookTicketForTravel("bus");
    }

}

