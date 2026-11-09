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
    public partial class Sign_up : Form
    {
        string file = @"C:\Users\User\source\repos\Even_Lab9\Even_Lab9\TextFile.txt";
        public Sign_up()
        {
            InitializeComponent();
        }

        private void label4_Click(object sender, EventArgs e)
        {

        }

        private void label7_Click(object sender, EventArgs e)
        {
            Form1 login = new Form1();
            login.Show();
            this.Hide();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            

          
            if (File.Exists(file))
            {
                string str = File.ReadAllText(file);
                Console.WriteLine(str);
            }
        }
    }
}
