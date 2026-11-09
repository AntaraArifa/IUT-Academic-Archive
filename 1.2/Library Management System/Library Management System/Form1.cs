using System.Configuration;

namespace Library_Management_System
{
    List<User> users = new List<User>();
    List<Book> books = new List<Book>();
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void listBox1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void Add_user_button_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(Id_tb.Text);
            string name = name_tb.Text;
            string address = address_tb.Text;

            User dummy = new User (id, name, address);
            Users.Add(dummy);
            MessageBox.Show("User has been added Successfully");
        }

        private void Rent_book_button_Click(object sender, EventArgs e)
        {

        }

        private void Del_Book_button_Click(object sender, EventArgs e)
        {

        }

        private void Add_book_button_Click(object sender, EventArgs e)
        {

        }

        private void Show_book_button_Click(object sender, EventArgs e)
        {
            
        }
    }
}