using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lab_Task_02_Combined
{
    internal class Buffer
    {
        private string content;

        public Buffer(string content)
        {
            this.content = content;
        }

        public string GetContent()
        {
            return content;
        }
    }
}
