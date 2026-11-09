using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lab_Task_02_Combined
{
    internal class TextEditor
    {
        private Buffer buffer;
        private File file;


        public TextEditor(File file)
        {
            this.file = file;
            this.buffer = new Buffer("");
        }

        public void Open()
        {
            Console.WriteLine($"Opening file: {file.GetFileName()}");
            // Load file content into buffer
            buffer = new Buffer($"Content of {file.GetFileName()}");
        }

        public void Edit(string newContent)
        {
            Console.WriteLine("Editing content...");
            buffer = new Buffer(newContent);
        }

        public void Save()
        {
            Console.WriteLine($"Saving changes to file: {file.GetFileName()}");
            // Save buffer content to file
        }

        public void Close()
        {
            Console.WriteLine($"Closing file: {file.GetFileName()}");
            buffer = null; // Buffer is destroyed as part of composition
        }

        public string GetContent()
        {
            return buffer.GetContent();
        }
    }
}
