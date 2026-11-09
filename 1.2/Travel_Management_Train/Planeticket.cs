using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Drawing.Printing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace trial_transportation
{
    public partial class Planeticket : Form
    {
        private PrintDocument printDocument;
        public Planeticket()
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
            string seat=label15.Text;
            string amount=label17.Text;





            string print = "\n\n\n\n" + "\t\t" + "Go EaSy" + "\n\n\n" + "\t      " + "TICKET RECEIPT" + "\n\n\n" + "Name: " + name + "\n" + "From: " + from + "\n" + "To: " + to + "\n" + "Date: " + date + "\n" + "Class: " + Plane.fclass+"\n"+"Seat: "+seat + "\n" + "Amount: " + Plane.famount;
            Font font = new Font("Times New Roman", 26, FontStyle.Regular);
            e.Graphics.DrawString(print, font, Brushes.Black, new PointF(50, 50));


        }
        private void pictureBox1_Click(object sender, EventArgs e)
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

        private void label11_Click(object sender, EventArgs e)
        {
            
        }

        private void Planeticket_Load(object sender, EventArgs e)
        {
            label5.Text = Plane.fname;
            label6.Text = Plane.ffrom;
            label7.Text =   Plane.fto;
            label8.Text = Plane.fdate;
            label11.Text = Plane.fclass;
            label13.Text = Plane.fflight;
            label15.Text = Plane.fseat;
            label17.Text = Plane.famount;
        }

        private void button2_Click(object sender, EventArgs e)
        {
            MessageBox.Show("Your ticket has been confirmed.");
        }

        private void back_button_Click(object sender, EventArgs e)
        {
            Form2 form2 = new Form2();


            form2.Show();


            this.Hide();
        }
    }
}
