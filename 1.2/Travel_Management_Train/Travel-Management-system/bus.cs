using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using static trial_transportation.Booking;

namespace trial_transportation
{




    public partial class bus : Form
    {



        private List<Booking> bookings;




        public bus()
        {
            InitializeComponent();
            bookings = new List<Booking>();
        }







        private void bus_Load(object sender, EventArgs e)
        {

        }




        private void nameTextBox_TextChanged(object sender, EventArgs e)
        {

        }




        private void button2_Click(object sender, EventArgs e)
        {




            string name = nameTextBox.Text;
            string email = emailTextBox.Text;
            string phone = phoneTextBox.Text;
            string From = comboBox1.SelectedItem.ToString();
            string To = comboBox2.SelectedItem.ToString();
            DateTime travelDate = travelDateTimePicker.Value.Date;
            int seatNumber = (int)seatNumericUpDown.Value;





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





            nameTextBox.Clear();
            emailTextBox.Clear();
            phoneTextBox.Clear();
            comboBox1.SelectedIndex = -1;
            comboBox2.SelectedIndex = -1;
            travelDateTimePicker.Value = DateTime.Today;
            seatNumericUpDown.Value = 1;
        }





        private void button_remove_Click(object sender, EventArgs e)
        {

        }




        private void button1_Click(object sender, EventArgs e)
        {
            Form2 f2 = new Form2();
            f2.Show();
            this.Hide();
        }



    }



}
