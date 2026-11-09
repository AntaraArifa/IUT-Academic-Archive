using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;




namespace trial_transportation
{



    public partial class Form2 : Form
    {



        public Form2()
        {
            InitializeComponent();
            label1.Text = "Welcome" + " " + Form1.instance.usern + "!";
        }





        private void button5_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }





        private void button1_Click(object sender, EventArgs e)
        {
            Form1 f2 = new Form1();
            f2.Show();
            this.Hide();
        }




        private void Form2_Load(object sender, EventArgs e)
        {

        }





        private void button2_Click(object sender, EventArgs e)
        {
            bus b = new bus();
            b.Show();
            this.Hide();
        }






        private void button3_Click(object sender, EventArgs e)
        {
            Form3 train = new Form3();
            train.Show();
            this.Hide();

        }

        private void pictureBox1_Click(object sender, EventArgs e)
        {

        }

        private void pictureBox2_Click(object sender, EventArgs e)
        {

        }

        private void pictureBox3_Click(object sender, EventArgs e)
        {

        }

        private void button6_Click(object sender, EventArgs e)
        {
            Profile pf = new Profile();
            pf.Show();
            this.Hide();

        }

        private void label3_Click(object sender, EventArgs e)
        {

        }

        private void button4_Click(object sender, EventArgs e)
        {
            Plane p = new Plane();
            p.Show();
            this.Hide();

        }

        private void label1_Click(object sender, EventArgs e)
        {

        }
    }
}
