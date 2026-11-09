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
    public partial class Train : Form
    {
        public Train()
        {
            InitializeComponent();
        }

        private void Train_Load(object sender, EventArgs e)
        {

        }

        private void btnreset_Click(object sender, EventArgs e)
        {
            txtname.Clear();

            txtemail.Clear();

            txtphone.Clear();


            cmbfrom.Text = "None";

            cmbto.Text = "None";

            cmbdate.Text = "None";

            cmbclass.Text = "None";

            cmbseat.Text = "None";

            cmbticket.Text = "None";

            txtamount.Text = "None";

        }

        private void btntotal_Click(object sender, EventArgs e)
        {
            Ticket_Price Travel_price = new Ticket_Price();

            Class_price Seat_price = new Class_price();

            double[] Travelcost = new double[20];

            double[] Seatcost = new double[20];

            double amount;


            if (cmbto.Text == "Dhaka")

            {
                Travelcost[0] = Travel_price.Dhaka;

                if (cmbclass.Text == "Seat Non-Ac")
                {
                    Seatcost[0] = Seat_price.Seat_Non_Ac;
                }
                else if (cmbclass.Text == "Seat Ac")
                {
                    Seatcost[0] = Seat_price.Seat_Ac;
                }
                else if (cmbclass.Text == "Cabin Non-Ac")
                {
                    Seatcost[0] = Seat_price.Cabin_Non_Ac;
                }
                else if (cmbclass.Text == "Cabin Ac")
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

                if (cmbclass.Text == "Seat Non-Ac")
                {
                    Seatcost[0] = Seat_price.Seat_Non_Ac;
                }
                else if (cmbclass.Text == "Seat Ac")
                {
                    Seatcost[0] = Seat_price.Seat_Ac;
                }
                else if (cmbclass.Text == "Cabin Non-Ac")
                {
                    Seatcost[0] = Seat_price.Cabin_Non_Ac;
                }
                else if (cmbclass.Text == "Cabin Ac")
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

                if (cmbclass.Text == "Seat Non-Ac")
                {
                    Seatcost[0] = Seat_price.Seat_Non_Ac;
                }
                else if (cmbclass.Text == "Seat Ac")
                {
                    Seatcost[0] = Seat_price.Seat_Ac;
                }
                else if (cmbclass.Text == "Cabin Non-Ac")
                {
                    Seatcost[0] = Seat_price.Cabin_Non_Ac;
                }
                else if (cmbclass.Text == "Cabin Ac")
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

                if (cmbclass.Text == "Seat Non-Ac")
                {
                    Seatcost[0] = Seat_price.Seat_Non_Ac;
                }
                else if (cmbclass.Text == "Seat Ac")
                {
                    Seatcost[0] = Seat_price.Seat_Ac;
                }
                else if (cmbclass.Text == "Cabin Non-Ac")
                {
                    Seatcost[0] = Seat_price.Cabin_Non_Ac;
                }
                else if (cmbclass.Text == "Cabin Ac")
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

                if (cmbclass.Text == "Seat Non-Ac")
                {
                    Seatcost[0] = Seat_price.Seat_Non_Ac;
                }
                else if (cmbclass.Text == "Seat Ac")
                {
                    Seatcost[0] = Seat_price.Seat_Ac;
                }
                else if (cmbclass.Text == "Cabin Non-Ac")
                {
                    Seatcost[0] = Seat_price.Cabin_Non_Ac;
                }
                else if (cmbclass.Text == "Cabin Ac")
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

                if (cmbclass.Text == "Seat Non-Ac")
                {
                    Seatcost[0] = Seat_price.Seat_Non_Ac;
                }
                else if (cmbclass.Text == "Seat Ac")
                {
                    Seatcost[0] = Seat_price.Seat_Ac;
                }
                else if (cmbclass.Text == "Cabin Non-Ac")
                {
                    Seatcost[0] = Seat_price.Cabin_Non_Ac;
                }
                else if (cmbclass.Text == "Cabin Ac")
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
    }
}
