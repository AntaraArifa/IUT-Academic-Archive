using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Xml.Linq;
using static System.Windows.Forms.VisualStyles.VisualStyleElement;

namespace trial_transportation
{
    public partial class signup : Form
    {
        public signup()
        {
            InitializeComponent();
        }

        List<string> user = new List<string>();

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void signup_Load(object sender, EventArgs e)
        {
           





            StreamReader s1 = new StreamReader(@"C:\Users\USER\source\repos\Travel_Management_Train\Travel-Management-system\user.txt");
            string line = "";
            while ((line = s1.ReadLine()) != null)
            {


                string[] components = line.Split(" ".ToCharArray());

                user.Add(components[6]);



            }




            s1.Close();
        }




        private void button2_Click(object sender, EventArgs e)
        {


            Form1 form = new Form1();
            form.Show();
            this.Hide();
        }




        private void button1_Click(object sender, EventArgs e)
        {



            string phone = textBox2.Text;
            string userName = textBox6.Text;
            string name = textBox1.Text;
            string pass = textBox7.Text;



            string email = textBox3.Text;
            string nation = textBox4.Text;
            string gender = comboBox1.Text;
            string country = textBox5.Text;

           
                string a = (textBox6.Text);
                int c = a.Length;


                string b = (textBox7.Text);
                int d = b.Length;





                if (c >= 4 && d >= 6)
                {
                    
                   

                    string path = @"C:\Users\USER\source\repos\Travel_Management_Train\Travel-Management-system\user.txt";
                    bool use = true;




                    foreach (string u in user)
                    {
                        if (u == userName)
                        {
                            MessageBox.Show("Username not available!");
                            use = false;
                            break;
                        }
                    }




                    if (use == true)
                    {
                        //int phone = Convert.ToInt32(textBox2.Text);
                        MessageBox.Show("created!");

                        string s = textBox1.Text + " " + textBox2.Text + " " + textBox4.Text + " " + comboBox1.Text + " " + textBox5.Text + " " + textBox6.Text + " " + textBox7.Text;

                        File.AppendAllText(path, name + " " + phone + " " + email + " " +  nation + " " + gender + " " + country + " " + userName + " " + pass);

                        File.AppendAllText(path, "\n");

                        Form2 f1 = new Form2();
                        f1.Show();
                        this.Hide();


                    }



                }


                else
                {



                    MessageBox.Show("minimum 6 characters");



                }
          

            
        }





        private void textBox6_TextChanged(object sender, EventArgs e)
        {


        }




        private void textBox7_TextChanged(object sender, EventArgs e)
        {

        }




        private void label5_Click(object sender, EventArgs e)
        {

        }




        private void label3_Click(object sender, EventArgs e)
        {

        }




        private void textBox2_TextChanged(object sender, EventArgs e)
        {

        }




        private void label9_Click(object sender, EventArgs e)
        {

        }




    }



}
