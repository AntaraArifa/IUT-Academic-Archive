using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lab_Task_09_02
{
    class Node<T> where T : Shape
    {
        public T Data { get; set; }

        public Node(T data)
        {
            Data = data;
        }
    }
}
