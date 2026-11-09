using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lab_Task_08_02
{

    public class MinMaxStack<T> where T : IComparable<T>
    {
        private Stack<T> stack;
        private Stack<T> maxStack;
        private bool useMax;

        public MinMaxStack(string condition)
        {
            stack = new Stack<T>();
            maxStack = new Stack<T>();
            useMax = condition.ToLower() == "max";
        }

        public void Push(T value)
        {
            stack.Push(value);

            if (maxStack.Count == 0 ||
                (useMax && value.CompareTo(maxStack.Peek()) >= 0) ||
                (!useMax && value.CompareTo(maxStack.Peek()) <= 0))
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

        public T Aggregate()
        {
            if (maxStack.Count == 0)
            {
                throw new InvalidOperationException("Stack is empty.");
            }

            return maxStack.Peek();
        }
    }

}
