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
    public partial class Form3 : Form
    {

        private List<Booking2> bookings;
        public Form3()
        {
            InitializeComponent();
            bookings = new List<Booking2>();
        }

        public static string fname = " ";
        public static string ffrom = " ";
        public static string fto = " ";
        public static string fdate = " ";
        public static string fclass = " ";
        public static string famount = " ";


        private void btnreset_Click(object sender, EventArgs e)
        {
            txtname.Clear();
            txtemail.Clear();
            txtphone.Clear();


            cmbfrom.Text = "None";

            cmbto.Text = "None";

            cmbticket.Text = "None";

            cmbticket.Text = "None";

            txtamount.Text = "None";
        }

        private void btntotal_Click(object sender, EventArgs e)
        {
            Ticket_price Travel_price = new Ticket_price();
            Class_price Seat_price = new Class_price();
            double[] Travelcost = new double[20];
            double[] Seatcost = new double[20];
            double amount;

            if (cmbto.Text == "Dhaka")
            {
                Travelcost[0] = Travel_price.Dhaka;

                if (cmbticket.Text == "Seat Non-Ac")
                {
                    Seatcost[0] = Seat_price.Seat_Non_Ac;
                }

                else if (cmbticket.Text == "Seat Ac")
                {
                    Seatcost[0] = Seat_price.Seat_Ac;
                }

                else if (cmbticket.Text == "Cabin Non-Ac")
                {
                    Seatcost[0] = Seat_price.Cabin_Non_Ac;
                }

                else if (cmbticket.Text == "Cabin Ac")
                {
                    Seatcost[0] = Seat_price.Cabin_Ac;
                }

                amount = Travelcost[0] + Seatcost[0];

                if (cmbticket.Text == "1")
                {
                    amount = 1 * amount;
                }

                else if (cmbticket.Text == "2")
                {
                    amount = 2 * amount;
                }

                else if (cmbticket.Text == "3")
                {
                    amount = 3 * amount;
                }

                txtamount.Text = string.Format("{0:C}", amount);
            }

            if (cmbto.Text == "Rajshahi")
            {
                Travelcost[0] = Travel_price.Rajshahi;

                if (cmbticket.Text == "Seat Non-Ac")
                {
                    Seatcost[0] = Seat_price.Seat_Non_Ac;
                }

                else if (cmbticket.Text == "Seat Ac")
                {
                    Seatcost[0] = Seat_price.Seat_Ac;
                }

                else if (cmbticket.Text == "Cabin Non-Ac")
                {
                    Seatcost[0] = Seat_price.Cabin_Non_Ac;
                }

                else if (cmbticket.Text == "Cabin Ac")
                {
                    Seatcost[0] = Seat_price.Cabin_Ac;
                }


                amount = Travelcost[0] + Seatcost[0];

                if (cmbticket.Text == "1")
                {
                    amount = 1 * amount;
                }

                else if (cmbticket.Text == "2")
                {
                    amount = 2 * amount;
                }

                else if (cmbticket.Text == "3")
                {
                    amount = 3 * amount;
                }

                txtamount.Text = string.Format("{0:C}", amount);
            }

            if (cmbto.Text == "Khulna")
            {
                Travelcost[0] = Travel_price.Khulna;

                if (cmbticket.Text == "Seat Non-Ac")
                {
                    Seatcost[0] = Seat_price.Seat_Non_Ac;
                }

                else if (cmbticket.Text == "Seat Ac")
                {
                    Seatcost[0] = Seat_price.Seat_Ac;
                }

                else if (cmbticket.Text == "Cabin Non-Ac")
                {
                    Seatcost[0] = Seat_price.Cabin_Non_Ac;
                }

                else if (cmbticket.Text == "Cabin Ac")
                {
                    Seatcost[0] = Seat_price.Cabin_Ac;
                }


                amount = Travelcost[0] + Seatcost[0];

                if (cmbticket.Text == "1")
                {
                    amount = 1 * amount;
                }

                else if (cmbticket.Text == "2")
                {
                    amount = 2 * amount;
                }

                else if (cmbticket.Text == "3")
                {
                    amount = 3 * amount;
                }

                txtamount.Text = string.Format("{0:C}", amount);
            }

            if (cmbto.Text == "Sylhet")
            {
                Travelcost[0] = Travel_price.Sylhet;

                if (cmbticket.Text == "Seat Non-Ac")
                {
                    Seatcost[0] = Seat_price.Seat_Non_Ac;
                }

                else if (cmbticket.Text == "Seat Ac")
                {
                    Seatcost[0] = Seat_price.Seat_Ac;
                }

                else if (cmbticket.Text == "Cabin Non-Ac")
                {
                    Seatcost[0] = Seat_price.Cabin_Non_Ac;
                }

                else if (cmbticket.Text == "Cabin Ac")
                {
                    Seatcost[0] = Seat_price.Cabin_Ac;
                }


                amount = Travelcost[0] + Seatcost[0];

                if (cmbticket.Text == "1")
                {
                    amount = 1 * amount;
                }

                else if (cmbticket.Text == "2")
                {
                    amount = 2 * amount;
                }

                else if (cmbticket.Text == "3")
                {
                    amount = 3 * amount;
                }

                txtamount.Text = string.Format("{0:C}", amount);
            }

            if (cmbto.Text == "Rangpur")
            {
                Travelcost[0] = Travel_price.Rangpur;

                if (cmbticket.Text == "Seat Non-Ac")
                {
                    Seatcost[0] = Seat_price.Seat_Non_Ac;
                }

                else if (cmbticket.Text == "Seat Ac")
                {
                    Seatcost[0] = Seat_price.Seat_Ac;
                }

                else if (cmbticket.Text == "Cabin Non-Ac")
                {
                    Seatcost[0] = Seat_price.Cabin_Non_Ac;
                }

                else if (cmbticket.Text == "Cabin Ac")
                {
                    Seatcost[0] = Seat_price.Cabin_Ac;
                }


                amount = Travelcost[0] + Seatcost[0];

                if (cmbticket.Text == "1")
                {
                    amount = 1 * amount;
                }

                else if (cmbticket.Text == "2")
                {
                    amount = 2 * amount;
                }

                else if (cmbticket.Text == "3")
                {
                    amount = 3 * amount;
                }

                txtamount.Text = string.Format("{0:C}", amount);
            }

            if (cmbto.Text == "Chittagong")
            {
                Travelcost[0] = Travel_price.Chittagong;

                if (cmbticket.Text == "Seat Non-Ac")
                {
                    Seatcost[0] = Seat_price.Seat_Non_Ac;
                }

                else if (cmbticket.Text == "Seat Ac")
                {
                    Seatcost[0] = Seat_price.Seat_Ac;
                }

                else if (cmbticket.Text == "Cabin Non-Ac")
                {
                    Seatcost[0] = Seat_price.Cabin_Non_Ac;
                }

                else if (cmbticket.Text == "Cabin Ac")
                {
                    Seatcost[0] = Seat_price.Cabin_Ac;
                }

                amount = Travelcost[0] + Seatcost[0];

                if (cmbticket.Text == "1")

                {
                    amount = 1 * amount;
                }

                else if (cmbticket.Text == "2")
                {
                    amount = 2 * amount;
                }

                else if (cmbticket.Text == "3")
                {
                    amount = 3 * amount;
                }

                txtamount.Text = string.Format("{0:C}", amount);
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Form2 form2 = new Form2();

            
            form2.Show();

            
            this.Hide();
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void txtname_TextChanged(object sender, EventArgs e)
        {

        }

        private void label3_Click(object sender, EventArgs e)
        {

        }

        private void txtphone_TextChanged(object sender, EventArgs e)
        {

        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void txtemail_TextChanged(object sender, EventArgs e)
        {

        }

        private void panel1_Paint(object sender, PaintEventArgs e)
        {

        }

        private void label7_Click(object sender, EventArgs e)
        {

        }

        private void cmbfrom_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void label6_Click(object sender, EventArgs e)
        {

        }

        private void cmbto_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void label5_Click(object sender, EventArgs e)
        {

        }

        private void cmbdate_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void label4_Click(object sender, EventArgs e)
        {

        }

        private void cmbclass_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void btnadd_Click(object sender, EventArgs e)
        {

        }

        private void panel2_Paint(object sender, PaintEventArgs e)
        {

        }

        private void panel3_Paint(object sender, PaintEventArgs e)
        {

        }

        private void cmbseat_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void label9_Click(object sender, EventArgs e)
        {

        }

        private void cmbticket_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void label_Click(object sender, EventArgs e)
        {

        }

        private void txtamount_Click(object sender, EventArgs e)
        {

        }

        private void panel4_Paint(object sender, PaintEventArgs e)
        {

        }

        private void Form3_Load(object sender, EventArgs e)
        {

        }

        private void button2_Click(object sender, EventArgs e)
        {
            string name = txtname.Text;
            string phone = txtphone.Text;
            string email = txtemail.Text;
            string From = cmbfrom.SelectedItem.ToString();
            string To = cmbto.SelectedItem.ToString();
            DateTime travelDate = travelDateTimePicker.Value.Date;
            string seatclass = cmbclass.SelectedItem.ToString();

            foreach (Booking2 booking in bookings)
            {
                if (booking.TravelDate == travelDate && booking.SeatClass == seatclass)
                {
                    MessageBox.Show("This seat has already been booked for the selected date. Please choose another seat or date.");
                    return;
                }
            }


            Booking2 newBooking = new Booking2(name, email, phone, From, To, travelDate, seatclass);
            bookings.Add(newBooking);

            string bookingDetails = $"{newBooking.Name}, {newBooking.Email}, {newBooking.Phone}, {newBooking.From}, {newBooking.To}, {newBooking.TravelDate.ToShortDateString()}, Seat {newBooking.SeatClass}";
            listBox1.Items.Add(bookingDetails);


        }

        private void button1_Click_1(object sender, EventArgs e)
        {
            txtname.Clear();

            txtemail.Clear();

            txtphone.Clear();


            cmbfrom.Text = "None";

            cmbto.Text = "None";

            cmbticket.Text = "None";

            cmbclass.Text = "None";

            txtamount.Text = "None";
        }

        private void button3_Click(object sender, EventArgs e)
        {

            fname = txtname.Text;
            ffrom = cmbfrom.Text;
            fto = cmbto.Text;
            fdate = travelDateTimePicker.Value.ToString();
            fclass = cmbclass.Text;
            famount=txtamount.Text;
           
            trainticket ticket = new trainticket();
            ticket.Show();
            this.Hide();
        }

        private void label5_Click_1(object sender, EventArgs e)
        {

        }
    }
}
