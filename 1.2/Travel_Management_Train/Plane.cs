using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Diagnostics;
using System.Drawing;
using System.Linq;
using System.Net.NetworkInformation;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Xml.Linq;
using static System.Windows.Forms.VisualStyles.VisualStyleElement;

namespace trial_transportation
{
    public partial class Plane : Form
    {
        private List<Booking3> bookings;
        public Plane()
        {
            InitializeComponent();
            bookings = new List<Booking3>();
        }

        public static string fname = " ";
        public static string ffrom = " ";
        public static string fto = " ";
        public static string fdate = " ";
        public static string fclass = " ";
        public static string fflight = " ";
        public static string fseat = " ";
        public static string famount = " ";


        private void Plane_Load(object sender, EventArgs e)
        {

        }
        private void label10_Click(object sender, EventArgs e)
        {

        }

        private void listBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            listBox.Items.Add(cmb_seat.Text + "              " + 1400 + "              " + cmb_class.Text);
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Price TravelPrice = new Price();

            PClassPrice CPrice = new PClassPrice();

            FlightPrice FPrice = new FlightPrice();

            double[] Travelcost = new double[30];

            double[] Classcost = new double[30];

            double[] Flightcost = new double[30];

            double Total;

            if (cmbto.Text == "Dhaka")
            {
                Travelcost[0] = TravelPrice.Dhaka;
                if (cmb_class.Text == "Business")
                {
                    Classcost[0] = CPrice.Business;
                }
                else if (cmb_class.Text == "Economy")
                {
                    Classcost[0] = CPrice.Economy;
                }
                if (cmb_flight.Text == "US Bangla")
                {
                    Flightcost[0] = FPrice.USBangla;
                }
                else if (cmb_flight.Text == "Bangladesh Biman")
                {
                    Flightcost[0] = FPrice.BimanBangladesh;
                }
                else if (cmb_flight.Text == "Novo Air")
                {
                    Flightcost[0] = FPrice.NovoAir;
                }
            }
            Total = Travelcost[0] + Classcost[0] + Flightcost[0];

            total_text.Text = Total.ToString();

            if (cmbto.Text == "Chittagong")
            {
                Travelcost[0] = TravelPrice.Chittagong;
                if (cmb_class.Text == "Business")
                {
                    Classcost[0] = CPrice.Business;
                }
                else if (cmb_class.Text == "Economy")
                {
                    Classcost[0] = CPrice.Economy;
                }
                if (cmb_flight.Text == "US Bangla")
                {
                    Flightcost[0] = FPrice.USBangla;
                }
                else if (cmb_flight.Text == "Bangladesh Biman")
                {
                    Flightcost[0] = FPrice.BimanBangladesh;
                }
                else if (cmb_flight.Text == "Novo Air")
                {
                    Flightcost[0] = FPrice.NovoAir;
                }
            }
            Total = Travelcost[0] + Classcost[0] + Flightcost[0];

            total_text.Text = Total.ToString();

            if (cmbto.Text == "Barisal")
            {
                Travelcost[0] = TravelPrice.Barisal;
                if (cmb_class.Text == "Business")
                {
                    Classcost[0] = CPrice.Business;
                }
                else if (cmb_class.Text == "Economy")
                {
                    Classcost[0] = CPrice.Economy;
                }
                if (cmb_flight.Text == "US Bangla")
                {
                    Flightcost[0] = FPrice.USBangla;
                }
                else if (cmb_flight.Text == "Bangladesh Biman")
                {
                    Flightcost[0] = FPrice.BimanBangladesh;
                }
                else if (cmb_flight.Text == "Novo Air")
                {
                    Flightcost[0] = FPrice.NovoAir;
                }
            }
            Total = Travelcost[0] + Classcost[0] + Flightcost[0];

            total_text.Text = Total.ToString();

            if (cmbto.Text == "Sylhet")
            {
                Travelcost[0] = TravelPrice.Sylhet;
                if (cmb_class.Text == "Business")
                {
                    Classcost[0] = CPrice.Business;
                }
                else if (cmb_class.Text == "Economy")
                {
                    Classcost[0] = CPrice.Economy;
                }
                if (cmb_flight.Text == "US Bangla")
                {
                    Flightcost[0] = FPrice.USBangla;
                }
                else if (cmb_flight.Text == "Bangladesh Biman")
                {
                    Flightcost[0] = FPrice.BimanBangladesh;
                }
                else if (cmb_flight.Text == "Novo Air")
                {
                    Flightcost[0] = FPrice.NovoAir;
                }
            }
            Total = Travelcost[0] + Classcost[0] + Flightcost[0];

            total_text.Text = Total.ToString();

            if (cmbto.Text == "Rajshahi")
            {
                Travelcost[0] = TravelPrice.Rajshahi;
                if (cmb_class.Text == "Business")
                {
                    Classcost[0] = CPrice.Business;
                }
                else if (cmb_class.Text == "Economy")
                {
                    Classcost[0] = CPrice.Economy;
                }
                if (cmb_flight.Text == "US Bangla")
                {
                    Flightcost[0] = FPrice.USBangla;
                }
                else if (cmb_flight.Text == "Bangladesh Biman")
                {
                    Flightcost[0] = FPrice.BimanBangladesh;
                }
                else if (cmb_flight.Text == "Novo Air")
                {
                    Flightcost[0] = FPrice.NovoAir;
                }
            }
            Total = Travelcost[0] + Classcost[0] + Flightcost[0];

            total_text.Text = Total.ToString();

        }

        private void label10_Click_1(object sender, EventArgs e)
        {

        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void button2_Click_1(object sender, EventArgs e)
        {

            Form2 f2 = new Form2();

            f2.Show();

            this.Hide();
        }

        private void listBox_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void Total_Click(object sender, EventArgs e)
        {

            Price TravelPrice = new Price();

            PClassPrice CPrice = new PClassPrice();

            FlightPrice FPrice = new FlightPrice();

            double[] Travelcost = new double[30];

            double[] Classcost = new double[30];

            double[] Flightcost = new double[30];

            double Total;

            if (cmbto.Text == "Dhaka")
            {
                Travelcost[0] = TravelPrice.Dhaka;
                if (cmb_class.Text == "Business")
                {
                    Classcost[0] = CPrice.Business;
                }
                else if (cmb_class.Text == "Economy")
                {
                    Classcost[0] = CPrice.Economy;
                }
                if (cmb_flight.Text == "US Bangla")
                {
                    Flightcost[0] = FPrice.USBangla;
                }
                else if (cmb_flight.Text == "Bangladesh Biman")
                {
                    Flightcost[0] = FPrice.BimanBangladesh;
                }
                else if (cmb_flight.Text == "Novo Air")
                {
                    Flightcost[0] = FPrice.NovoAir;
                }
            }
            Total = Travelcost[0] + Classcost[0] + Flightcost[0];

            total_text.Text = string.Format("{0:C}", total_text); ;

            if (cmbto.Text == "Chittagong")
            {
                Travelcost[0] = TravelPrice.Chittagong;
                if (cmb_class.Text == "Business")
                {
                    Classcost[0] = CPrice.Business;
                }
                else if (cmb_class.Text == "Economy")
                {
                    Classcost[0] = CPrice.Economy;
                }
                if (cmb_flight.Text == "US Bangla")
                {
                    Flightcost[0] = FPrice.USBangla;
                }
                else if (cmb_flight.Text == "Bangladesh Biman")
                {
                    Flightcost[0] = FPrice.BimanBangladesh;
                }
                else if (cmb_flight.Text == "Novo Air")
                {
                    Flightcost[0] = FPrice.NovoAir;
                }
            }
            Total = Travelcost[0] + Classcost[0] + Flightcost[0];

            total_text.Text = string.Format("{0:C}", total_text) ;

            if (cmbto.Text == "Barisal")
            {
                Travelcost[0] = TravelPrice.Barisal;
                if (cmb_class.Text == "Business")
                {
                    Classcost[0] = CPrice.Business;
                }
                else if (cmb_class.Text == "Economy")
                {
                    Classcost[0] = CPrice.Economy;
                }
                if (cmb_flight.Text == "US Bangla")
                {
                    Flightcost[0] = FPrice.USBangla;
                }
                else if (cmb_flight.Text == "Bangladesh Biman")
                {
                    Flightcost[0] = FPrice.BimanBangladesh;
                }
                else if (cmb_flight.Text == "Novo Air")
                {
                    Flightcost[0] = FPrice.NovoAir;
                }
            }
            Total = Travelcost[0] + Classcost[0] + Flightcost[0];

            total_text.Text = string.Format("{0:C}", total_text);

            if (cmbto.Text == "Sylhet")
            {
                Travelcost[0] = TravelPrice.Sylhet;
                if (cmb_class.Text == "Business")
                {
                    Classcost[0] = CPrice.Business;
                }
                else if (cmb_class.Text == "Economy")
                {
                    Classcost[0] = CPrice.Economy;
                }
                if (cmb_flight.Text == "US Bangla")
                {
                    Flightcost[0] = FPrice.USBangla;
                }
                else if (cmb_flight.Text == "Bangladesh Biman")
                {
                    Flightcost[0] = FPrice.BimanBangladesh;
                }
                else if (cmb_flight.Text == "Novo Air")
                {
                    Flightcost[0] = FPrice.NovoAir;
                }
            }
            Total = Travelcost[0] + Classcost[0] + Flightcost[0];

            total_text.Text = string.Format("{0:C}", total_text);

            if (cmbto.Text == "Rajshahi")

            {
                Travelcost[0] = TravelPrice.Rajshahi;
                if (cmb_class.Text == "Business")
                {
                    Classcost[0] = CPrice.Business;
                }
                else if (cmb_class.Text == "Economy")
                {
                    Classcost[0] = CPrice.Economy;
                }
                if (cmb_flight.Text == "US Bangla")
                {
                    Flightcost[0] = FPrice.USBangla;
                }
                else if (cmb_flight.Text == "Bangladesh Biman")
                {
                    Flightcost[0] = FPrice.BimanBangladesh;
                }
                else if (cmb_flight.Text == "Novo Air")
                {
                    Flightcost[0] = FPrice.NovoAir;
                }
            }
            Total = Travelcost[0] + Classcost[0] + Flightcost[0];

            total_text.Text = string.Format("{0:C}", total_text);
        }

        private void lblTotal_Click(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {   
            fname = name_text.Text;
            ffrom = cmbfrom.Text;
            fto = cmbto.Text;
            fdate = travelDateTimePicker.Value.ToString();
            fclass = cmb_class.Text;
            fflight=cmb_flight.Text;
            fseat = cmb_seat.Text;
            famount= total_text.Text;
            Planeticket ticket = new Planeticket();
            ticket.Show();
            this.Hide();
        }

        private void cmbclass_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void flight_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void seat_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void dateTimePicker1_ValueChanged(object sender, EventArgs e)
        {

        }

        private void name_TextChanged(object sender, EventArgs e)
        {

        }

        private void email_TextChanged(object sender, EventArgs e)
        {

        }

        private void contact_TextChanged(object sender, EventArgs e)
        {

        }

        private void From_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void To_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void label4_Click(object sender, EventArgs e)
        {

        }

        private void label_Click(object sender, EventArgs e)
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

        private void label11_Click(object sender, EventArgs e)
        {

        }

        private void label9_Click(object sender, EventArgs e)
        {

        }

        private void button3_Click(object sender, EventArgs e)
        {

            string name = name_text.Text;

            string email = email_text.Text;

            string phone = contact_text.Text;

            string from = cmbfrom.SelectedItem.ToString();

            string to = cmbto.SelectedItem.ToString();

            DateTime travelDate = travelDateTimePicker.Value.Date;

            string seatNumber = cmb_seat.SelectedItem.ToString();

            string seatClass = cmb_class.SelectedItem.ToString();

            foreach (Booking3 booking in bookings)
            {
                if (booking.TravelDate == travelDate && booking.SeatNumber == seatNumber)
                {
                    MessageBox.Show("This seat has already been booked for the selected date. Please choose another seat or date.");
                    return;
                }
            }

            Booking3 newBooking = new Booking3(name, email, phone, from, to, travelDate, seatNumber, seatClass);

            bookings.Add(newBooking);

            string bookingDetails = $"{newBooking.Name}, {newBooking.Email}, {newBooking.Contact}, {newBooking.From}, {newBooking.To}, {newBooking.TravelDate.ToShortDateString()}, Seat {newBooking.SeatClass}";
            listBox.Items.Add(bookingDetails);

        }

        private void button4_Click(object sender, EventArgs e)
        {
            name_text.Clear();

            email_text.Clear();

            contact_text.Clear();

            total_text.Clear();


            cmbfrom.Text = "None";

            cmbto.Text = "None";

            cmb_class.Text = "None";

            cmb_flight.Text = "None";

            cmb_seat.Text = "None";
        }

        private void total_text_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
