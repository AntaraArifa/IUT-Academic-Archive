using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lab_Task_08
{
    public class GenericMaxStack<T> where T : IComparable<T>
    {
        private Stack<T> stack;
        private Stack<T> maxStack;

        public GenericMaxStack()
        {
            stack = new Stack<T>();
            maxStack = new Stack<T>();
        }

        public void Push(T value)
        {
            stack.Push(value);

            if (maxStack.Count == 0 || value.CompareTo(maxStack.Peek()) >= 0)
            {
                maxStack.Push(value);
            }
        }

        public void Pop()
        {
            if (stack.Count == 0)
            {
                throw new InvalidOperationException("Stack is empty.");
            }

            T top = stack.Pop();
            if (top.CompareTo(maxStack.Peek()) == 0)
            {
                maxStack.Pop();
            }
        }

        public T Max()
        {
            if (maxStack.Count == 0)
            {
                throw new InvalidOperationException("Stack is empty.");
            }

            return maxStack.Peek();
        }
    }

}
