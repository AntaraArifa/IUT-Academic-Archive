using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Delegation_Good_Example
{
    internal interface ITicket
    {
        bool BookTicket(Passenger passenger);
    }
}
