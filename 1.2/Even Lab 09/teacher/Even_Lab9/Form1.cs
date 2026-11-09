using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.IO;

namespace Even_Lab9
{
    public partial class Form1 : Form
    {
        string file = @"C:\Users\User\source\repos\Even_Lab9\Even_Lab9\TextFile.txt";
        public Form1()
        {
            InitializeComponent();
        }

        private void label4_Click(object sender, EventArgs e)
        {
            Sign_up signup = new Sign_up();
            signup.Show();
            this.Hide();
        }
    }
}
