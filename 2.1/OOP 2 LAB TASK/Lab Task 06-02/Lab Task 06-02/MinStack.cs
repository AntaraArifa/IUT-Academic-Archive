using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lab_Task_06_02
{

    public class MinStack
    {
        private Stack<int> stack;
        private Stack<int> minStack;

        public MinStack()
        {
            stack = new Stack<int>();
            minStack = new Stack<int>();
        }

        public void Push(int val)
        {
            stack.Push(val);

            if (minStack.Count == 0 || val <= minStack.Peek())
            {
                minStack.Push(val);
            }
        }

        public void Pop()
        {
            if (stack.Count == 0)
            {
                throw new InvalidOperationException("Stack is empty");
            }

            int top = stack.Pop();
            if (top == minStack.Peek())
            {
                minStack.Pop();
            }
        }

        public int Min()
        {
            if (minStack.Count == 0)
            {
                throw new InvalidOperationException("Stack is empty");
            }

            return minStack.Peek();
        }
    }
}
