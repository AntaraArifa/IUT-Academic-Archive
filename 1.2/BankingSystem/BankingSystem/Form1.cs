using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace BankingSystem
{
    public partial class Form1 : Form
    {
        BankAccount account = new BankAccount(210042132, "Antara", "Dhaka");
        public Form1()
        {
            InitializeComponent();
        }

        private void showbalanceButton_Click(object sender, EventArgs e)
        {
            MessageBox.Show($"Your current balance is BDT {account.getBalance()}");
        }

        private void depositButton_Click(object sender, EventArgs e)
        {
            account.deposit(Convert.ToDouble(amountTextBox.Text));
            amountTextBox.Clear();
            amountTextBox.Focus();
        }

        private void withdrawButton_Click(object sender, EventArgs e)
        {
            bool res = account.withdraw(Convert.ToDouble(amountTextBox.Text));
            if(res)
            {
                MessageBox.Show("Withdraw Successful !");
            }
            else
            {
                MessageBox.Show("Insufficient Amount : Withdraw Unsuccessful !");
            }
            amountTextBox.Clear();
            amountTextBox.Focus();
        }

        private void amountLabel_Click(object sender, EventArgs e)
        {

        }

        private void amountTextBox_TextChanged(object sender, EventArgs e)
        {

        }

        private void createaccButton_Click(object sender, EventArgs e)
        {

        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void showaccinfoButton_Click(object sender, EventArgs e)
        {
            
        }

        private void nameTextBox_TextChanged(object sender, EventArgs e)
        {

        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }
    }
}
