using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Drawing.Printing;
using System.Linq;
using System.Reflection.Emit;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace trial_transportation
{
    public partial class busticket : Form
    {
        private PrintDocument printDocument;
        public busticket()
        {
            InitializeComponent();

            printDocument = new PrintDocument();

            printDocument.PrintPage += PrintDocument_PrintPage;

        }
        public void PrintDocument_PrintPage(object sender, PrintPageEventArgs e)
        {

            string name = label5.Text;

            string from = label6.Text;

            string to = label7.Text;

            string date = label8.Text;
<<<<<<< HEAD

            string amount = label11.Text;
=======
            string amount=label11.Text;
>>>>>>> 7760babbe6ae5873343d8f0c5b5784eb8fa0b5e2
           





<<<<<<< HEAD
            string print = "\n\n\n\n" + "\t\t" + "Go EaSy" + "\n\n\n" + "\t      " + "TICKET RECEIPT" + "\n\n\n" + "Name: " + name + "\n" + "From: " + from + "\n" + "To: " + to + "\n" + "Date: " + date + "\n" + "Amount: " + amount ; 
=======
            string print = "\n\n\n\n" + "\t\t" + "Go EaSy" + "\n\n\n" + "\t      " + "TICKET RECEIPT" + "\n\n\n" + "Name: " + name + "\n" + "From: " + from + "\n" + "To: " + to + "\n" + "Date: " + date + "\n" + "Amount: " + bus.ffamount;
>>>>>>> 7760babbe6ae5873343d8f0c5b5784eb8fa0b5e2
            Font font = new Font("Times New Roman", 26, FontStyle.Regular);
            e.Graphics.DrawString(print, font, Brushes.Black, new PointF(50, 50));


        }

        private void label9_Click(object sender, EventArgs e)
        {

        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void label3_Click(object sender, EventArgs e)
        {

        }

        private void label4_Click(object sender, EventArgs e)
        {

        }

        private void label5_Click(object sender, EventArgs e)
        {

        }

        private void label6_Click(object sender, EventArgs e)
        {

        }

        private void label7_Click(object sender, EventArgs e)
        {

        }

        private void label8_Click(object sender, EventArgs e)
        {

        }

        private void label14_Click(object sender, EventArgs e)
        {

        }

        private void printDocument1_PrintPage(object sender, System.Drawing.Printing.PrintPageEventArgs e)
        {

        }

        private void printPreviewDialog1_Load(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            PrintDialog printDialog = new PrintDialog();
            printDialog.Document = printDocument;

            if (printDialog.ShowDialog() == DialogResult.OK)
            {

                printDocument.Print();
            }

            PrintPreviewDialog printPreviewDialog = new PrintPreviewDialog();

            printPreviewDialog.Document = printDocument;

            printPreviewDialog.ShowDialog();
        }

        private void label15_Click(object sender, EventArgs e)
        {

        }

        private void button2_Click(object sender, EventArgs e)
        {
            MessageBox.Show("Your ticket has been confirmed.");
        }

        private void label10_Click(object sender, EventArgs e)
        {

        }

        private void label11_Click(object sender, EventArgs e)
        {

        }

        private void label12_Click(object sender, EventArgs e)
        {

        }

        private void label13_Click(object sender, EventArgs e)
        {

        }

        private void busticket_Load(object sender, EventArgs e)
        {

            label5.Text = bus.ffname;
            label6.Text = bus.fffrom;
            label7.Text = bus.ffto;
            label8.Text = bus.ffdate;
<<<<<<< HEAD
            label11.Text = bus.ffamount;
         
=======
            label11.Text=bus.ffamount;
>>>>>>> 7760babbe6ae5873343d8f0c5b5784eb8fa0b5e2
          
        }

        private void back_Click(object sender, EventArgs e)
        {
            Form2 form2 = new Form2();

            form2.Show();

            this.Hide();
        }
    }
}
