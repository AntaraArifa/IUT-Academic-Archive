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
using static System.Windows.Forms.LinkLabel;
using static System.Windows.Forms.VisualStyles.VisualStyleElement;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.ListView;

namespace trial_transportation
{
    public partial class Profile : Form
    {

        public Profile()
        {
            InitializeComponent();
            label1.Text = "Welcome" + " " + Form1.instance.usern + "!";


        }

        string[] username = { "sheona", "athena" };
        string[] password = { "123456", "654321" };
        List<string> user = new List<string>();
        List<string> name = new List<string>();
        List<string> phone = new List<string>();
        List<string> email = new List<string>();
        List<string> nationality = new List<string>();
        List<string> gender = new List<string>();
        List<string> country = new List<string>();






        private void Profile_Load(object sender, EventArgs e)
        {

            StreamReader pf1 = new StreamReader(@"C:\Users\USER\source\repos\Travel_Management_Train\user.txt");
            string line = "";




            while ((line = pf1.ReadLine()) != null)
            {

                if (line.Contains(Form1.instance.usern))
                {
                    string[] components = line.Split(" ".ToCharArray());
                    name.Add(components[0]);
                    user.Add(components[6]);
                    email.Add(components[2]);
                    phone.Add(components[1]);

                    nationality.Add(components[3]);
                    gender.Add(components[5]);
                    country.Add(components[4]);


                    for (int i = 0; i < user.Count; i++)
                    {
                        if (user[i] == Form1.instance.usern)

                        {
                            label8.Text = name[i];
                            label9.Text = phone[i];
                            label10.Text = email[i];
                            label11.Text = nationality[i];
                            label12.Text = gender[i];
                            label13.Text = country[i];
                        }
                    }

                }



            }



        }

        private void label1_Click(object sender, EventArgs e)
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

        private void label12_Click(object sender, EventArgs e)
        {

        }
    }
}
