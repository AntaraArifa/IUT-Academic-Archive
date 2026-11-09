using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Library_Management_System
{

    public class Library
    {
        
        private List<LibraryMember> members;

        public Library()
        {
            members = new List<LibraryMember>();
        }


        public void AddMember(LibraryMember member)
        {
            members.Add(member);
        }

    }


}
