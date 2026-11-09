using Lab_Task_08;

class Program
{
    static void Main(string[] args)
    {
        
        var intStack = new GenericMaxStack<int>();
        intStack.Push(3);
        intStack.Push(5);
        intStack.Push(2);
        Console.WriteLine("Max (Integer Stack): " + intStack.Max());

        
        var doubleStack = new GenericMaxStack<double>();
        doubleStack.Push(49.75);
        doubleStack.Push(23.54);
        doubleStack.Push(100.0);
        Console.WriteLine("Max (Double Stack): " + doubleStack.Max()); 

        
        var stringStack = new GenericMaxStack<string>();
        stringStack.Push("OOC is bad");
        stringStack.Push("Nothing to understand");
        stringStack.Push("Try hard");
        Console.WriteLine("Max (String Stack): " + stringStack.Max()); 
    }
}
