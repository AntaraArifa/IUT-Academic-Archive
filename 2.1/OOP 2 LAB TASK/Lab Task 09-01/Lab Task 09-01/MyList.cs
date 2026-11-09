using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lab_Task_09_01
{
    class MyList<T>
    {
        private T[] items;
        private int count;

        public MyList()
        {
            items = new T[20];
            count = 0;
        }

        public void AddItem(T item)
        {
            if (count == items.Length)
            {
                Array.Resize(ref items, items.Length * 2);
            }

            items[count] = item;
            count++;
        }

        public T GetItem(int index)
        {
            if (index >= 0 && index < count)
            {
                return items[index];
            }
            throw new IndexOutOfRangeException("Index out of range.");
        }

        public T RemoveItem(int index)
        {
            if (index >= 0 && index < count)
            {
                T removedItem = items[index];
                for (int i = index; i < count - 1; i++)
                {
                    items[i] = items[i + 1];
                }
                count--;
                return removedItem;
            }
            throw new IndexOutOfRangeException("Index out of range.");
        }

        public int Size()
        {
            return count;
        }

        public bool IsEmpty()
        {
            return count == 0;
        }

        public void Clear()
        {
            items = new T[20]; 
            count = 0;
        }

        public bool Contains(T item)
        {
            for (int i = 0; i < count; i++)
            {
                if (items[i].Equals(item))
                {
                    return true;
                }
            }
            return false;
        }

        public T[] ToArray()
        {
            T[] result = new T[count];
            Array.Copy(items, result, count);
            return result;
        }
    }
}
