using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Diagnostics;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace cgpa_calc
{
    public partial class Form1 : Form
    {
        List<string> codesArray = new List<string>();
        List<int> TotalArray = new List<int>();
        List<double> GPAArray = new List<double>();
        List<string> GradesArray = new List<string>();
        public Form1()
        {
            InitializeComponent();
            Result_box.Items.Add("Course \t Total \t GPA \t Grade");
        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void Mid_label_Click(object sender, EventArgs e)
        {

        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void Add_button_Click(object sender, EventArgs e)
        {
            string code = course_comboBox.Text;
            codesArray.Add(code);

            int mid = Convert.ToInt32(mid_textBox.Text) / 3;
            int final = Convert.ToInt32(final_textBox.Text) /3;
            int attendance = Convert.ToInt32(attendance_textBox.Text) / 3;
            int quiz1 = Convert.ToInt32(quiz1_textBox.Text);
            int quiz2 = Convert.ToInt32(quiz2_textBox.Text);
            int quiz3 = Convert.ToInt32(quiz3_textBox.Text);
            int quiz4 = Convert.ToInt32(quiz4_textBox.Text);

            int[] qz= new int[4];
            qz[0] = quiz1;
            qz[1] = quiz2;
            qz[2] = quiz3;
            qz[3] = quiz4;

            Array.Sort(qz);

            int quiz = (qz[1] + qz[2] + qz[3]) / 3;

            int total = quiz + mid + final + attendance;
            TotalArray.Add(total);

            string Grade = "a";
            double GPA = 0.0;

            if (total >= 80)
            {
                Grade = "A+";
                GPA = 4.00;
            }
            else if (total >= 75 && total < 80)
            {
                Grade = "A";
                GPA = 3.75;
            }
            else if (total >= 70 && total < 75)
            {
                Grade = "A-";
                GPA = 3.50;
            }
            else if (total >= 65 && total < 70)
            {
                Grade = "B+";
                GPA = 3.25;
            }
            else if (total >= 60 && total < 65)
            {
                Grade = "B";
                GPA = 3.00;
            }
            else if (total >= 55 && total < 60)
            {
                Grade = "B-";
                GPA = 2.75;
            }
            else if (total >= 50 && total < 55)
            {
                Grade = "C+";
                GPA = 2.50;
            }
            else if (total >= 45 && total < 50)
            {
                Grade = "C";
                GPA = 2.25;
            }
            else if (total >= 40 && total < 45)
            {
                Grade = "D";
                GPA = 2.00;
            }
            else
            {
                Grade = "F";
                GPA = 0;
            }

            GPAArray.Add(GPA);
            GradesArray.Add(Grade);

            MessageBox.Show("Added Successfully. Please Add the next Course. When Done click Calculate after the last course");
            mid_textBox.Clear();
            final_textBox.Clear();
            quiz1_textBox.Clear();
            quiz2_textBox.Clear();
            quiz3_textBox.Clear();
            quiz4_textBox.Clear();
            attendance_textBox.Clear();


        }

        private void Submit_button_Click(object sender, EventArgs e)
        {
            for(int i = 0; i < GPAArray.Count; i++) 
            {
                string res = $"{codesArray[i]} \t {TotalArray[i]} \t {GPAArray[i]} \t {GradesArray[i]}";
                Result_box.Items.Add(res);
            }

            double sum = 0;
            for(int j = 0; j < GPAArray.Count; j++) 
            {
                sum += GPAArray[j];
            }

            double cgpa = sum/ GPAArray.Count;
            string strcgpa = Convert.ToString(cgpa);

            cgpa_label.Text = $"CGPA : {strcgpa}";
        }
    }
}
