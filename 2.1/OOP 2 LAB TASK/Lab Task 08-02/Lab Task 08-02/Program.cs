using Lab_Task_08_02;
using System;

class Program
{
    static void Main(string[] args)
    {

        MinMaxStack<int> maxStack = new MinMaxStack<int>("max");
       
        maxStack.Push(3);
        maxStack.Push(2);
        maxStack.Push(5);

        Console.WriteLine("Max Value: " + maxStack.Aggregate());


        MinMaxStack<int> minStack = new MinMaxStack<int>("min");

        minStack.Push(3);
        minStack.Push(2);
        minStack.Push(5);

        Console.WriteLine("Min Value: " + minStack.Aggregate());


    }

    
}