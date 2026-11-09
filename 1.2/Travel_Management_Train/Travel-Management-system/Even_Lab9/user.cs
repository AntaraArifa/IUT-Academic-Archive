using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Even_Lab9
{
     class user
    {
        string name { get; set; }
        string username { get; set; }
        string password { get; set; }

        user(string name, string username, string password)
        {
            this.name = name;
            this.username = username;
            this.password = password;
        }
    }
}
