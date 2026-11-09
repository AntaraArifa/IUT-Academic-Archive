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
    public partial class trainticket : Form
    {
        private PrintDocument printDocument;


        public trainticket()
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
            string amount=label13.Text;
           




            string print = "\n\n\n\n" + "\t\t" + "Go EaSy" + "\n\n\n" + "\t      " + "TICKET RECEIPT" + "\n\n\n" + "Name: " + name + "\n" + "From: " + from + "\n" + "To: " + to + "\n" + "Date: " + date + "\n" + "Class: " + Form3.fclass + "\n" + "Amount: " + Form3.famount;
            Font font = new Font("Times New Roman", 26, FontStyle.Regular);
            e.Graphics.DrawString(print, font, Brushes.Black, new PointF(50, 50));


        }
        private void trainticket_Load(object sender, EventArgs e)
        {
            label5.Text = Form3.fname;
            label6.Text = Form3.ffrom;
            label7.Text = Form3.fto;
            label8.Text = Form3.fdate;
            label11.Text = Form3.fclass;
            label13.Text = Form3.famount;

        }

        private void button2_Click(object sender, EventArgs e)
        {
            MessageBox.Show("Your ticket has been confirmed.");
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

        private void button_Back_Click(object sender, EventArgs e)
        {
            Form2 form2 = new Form2();

            form2.Show();

            this.Hide();
        }
    }
}
