using Lab_Task_02_Combined;

class Program
{
    static void Main(string[] args)
    {
        File file = new File("document.txt");
        TextEditor textEditor = new TextEditor(file);

        textEditor.Open();
        Console.WriteLine($"Initial Content: {textEditor.GetContent()}");

        textEditor.Edit("Updated content.");
        Console.WriteLine($"Updated Content: {textEditor.GetContent()}");

        textEditor.Save();
        textEditor.Close();
    }
}