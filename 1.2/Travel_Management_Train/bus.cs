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
using System.Xml.Linq;
using static trial_transportation.Booking;

namespace trial_transportation
{




    public partial class bus : Form
    {



        private PrintDocument printDocument;



        private List<Booking> bookings;




        public bus()
        {
            InitializeComponent();
            bookings = new List<Booking>();
          //  printDocument = new PrintDocument();
          //  printDocument.PrintPage += PrintDocument_PrintPage;
            
        }

        public static string ffname = " ";
        public static string fffrom = " ";
        public static string ffto = " ";
        public static string ffdate = " ";
        public static string ffamount = " ";
      /*  public void PrintDocument_PrintPage(object sender, PrintPageEventArgs e)
        {
          
            string name = this.txtname.Text;
            string email = txtemail.Text;
            string phone = txtphone.Text;
            string From = cmbfrom.SelectedItem.ToString();
            string To = cmbto.SelectedItem.ToString();
            DateTime travelDate = travelDateTimePicker.Value.Date;
      
      string print= "\t" + "\t" + "TICKET RECEIPT" +"\n" + "Name: "+ name+ " " + "\n" + "Email: " + email + "\n" + "Phone: " + phone + "\n" + "From: " +  From + "\n" + "To: " + To+ "\n"  + "Date: " + travelDate;
            Font font = new Font("Times New Roman", 12, FontStyle.Regular);
            e.Graphics.DrawString( print, font, Brushes.Black, new PointF(50, 50));
           
           
        }
      */

        private void button3_Click_1(object sender, EventArgs e)
        {
            {

                /* PrintDialog printDialog = new PrintDialog();
                 printDialog.Document = printDocument;

                 if (printDialog.ShowDialog() == DialogResult.OK)
                 {

                     printDocument.Print();
                 }

                 PrintPreviewDialog printPreviewDialog = new PrintPreviewDialog();
                 printPreviewDialog.Document = printDocument;
                 printPreviewDialog.ShowDialog();
                */

                ffname = txtname.Text;
                fffrom = cmbfrom.Text;
                ffto = cmbto.Text;
                ffamount = txtamount.Text;
                ffdate = travelDateTimePicker.Value.ToString();
                ffamount=txtamount.Text;
               
                busticket ticket = new busticket();
                ticket.Show();
                this.Hide();

            }
        }





        private void bus_Load(object sender, EventArgs e)
        {

        }




        private void nameTextBox_TextChanged(object sender, EventArgs e)
        {

        }




        private void button2_Click(object sender, EventArgs e)
        {




            string name = this.txtname.Text;
            string email = txtemail.Text;
            string phone = txtphone.Text;
            string From = cmbfrom.SelectedItem.ToString();
            string To = cmbto.SelectedItem.ToString();
            DateTime travelDate = travelDateTimePicker.Value.Date;
            int seatNumber = (int)seatNumeric.Value;





            foreach (Booking booking in bookings)
            {
                if (booking.TravelDate == travelDate && booking.SeatNumber == seatNumber)
                {
                    MessageBox.Show("This seat has already been booked for the selected date. Please choose another seat or date.");
                    return;
                }
            }




            Booking newBooking = new Booking(name, email, phone, From, To, travelDate, seatNumber);
            bookings.Add(newBooking);





            string bookingDetails = $"{newBooking.Name}, {newBooking.Email}, {newBooking.Phone}, {newBooking.From}, {newBooking.To}, {newBooking.TravelDate.ToShortDateString()}, Seat {newBooking.SeatNumber}";
            listBox_Customer.Items.Add(bookingDetails);





            this.txtname.Clear();
            txtemail.Clear();
            txtphone.Clear();
            cmbfrom.SelectedIndex = -1;
            cmbto.SelectedIndex = -1;
            travelDateTimePicker.Value = DateTime.Today;
            seatNumeric.Value = 1;
        }





        private void button_remove_Click(object sender, EventArgs e)
        {
            txtname.Clear();

            txtemail.Clear();

            txtphone.Clear();


            cmbfrom.Text = "None";

            cmbto.Text = "None";

            txtamount.Text = "None";
        }




        private void button1_Click(object sender, EventArgs e)
        {
            Form2 f2 = new Form2();
            f2.Show();
            this.Hide();
        }

        private void printDocument4_PrintPage(object sender, System.Drawing.Printing.PrintPageEventArgs e)
        {

        }

        private void listBox_Customer_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void button4_Click(object sender, EventArgs e)
        {
            Ticket_price2 Travel_price = new Ticket_price2();

            double[] Travelcost = new double[20];

            double amount;

            if (cmbto.Text == "Dhaka")
            {
                Travelcost[0] = Travel_price.Dhaka;
                amount = Travelcost[0];

                txtamount.Text = string.Format("{0:C}", amount);
            }

            if (cmbto.Text == "Rajshahi")
            {
                Travelcost[0] = Travel_price.Rajshahi;
                amount = Travelcost[0];

                txtamount.Text = string.Format("{0:C}", amount);
            }

            if (cmbto.Text == "Khulna")
            {
                Travelcost[0] = Travel_price.Khulna;
                amount = Travelcost[0];

                txtamount.Text = string.Format("{0:C}", amount);
            }

            if (cmbto.Text == "Sylhet")
            {
                Travelcost[0] = Travel_price.Sylhet;
                amount = Travelcost[0];

                txtamount.Text = string.Format("{0:C}", amount);
            }


            if (cmbto.Text == "Barisal")
            {
                Travelcost[0] = Travel_price.Barisal;
                amount = Travelcost[0];

                txtamount.Text = string.Format("{0:C}", amount);
            }

            if (cmbto.Text == "Chittagong")
            {
                Travelcost[0] = Travel_price.Chittagong;
                amount = Travelcost[0];

                txtamount.Text = string.Format("{0:C}", amount);
            }


        }
    }



}
