using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BankingSystem
{
    internal class BankAccount
    {
        private int accNo;
        private string name;
        private string branchName;
        private double balance;

       
        public BankAccount(int _accNo, string _name, string _branchName)
        {
            accNo= _accNo;
            name= _name;
            branchName= _branchName;
        }

        public void deposit(double amount)
        {
            balance += amount;
        }
        public bool withdraw(double amount)
        {
            if (balance >= amount)
            {
                balance -= amount;
                return true;
            }
            else
            {
                return false;
            }
        }
        public double getBalance()
        {
            return balance;
        }
       
    }
}
