using Lab_02_Task_02;

class Program
{
    static void Main(string[] args)
    {
        IPrinter epson = new EpsonPrinter();
        IPrinter canon = new CanonPrinter();

        PrintController epsonController = new PrintController(epson);
        PrintController canonController = new PrintController(canon);

        Console.WriteLine("Printing using Epson Printer:");
        epsonController.PrintDocument("Sample text");
        epsonController.PrintColorfulDocument("Colorful content");
        epsonController.PrintDuplexDocument("Duplex content");

        Console.WriteLine("\nPrinting using Canon Printer:");
        canonController.PrintDocument("Sample text");
        canonController.PrintColorfulDocument("Colorful content");
        canonController.PrintDuplexDocument("Duplex content");
    }
}






