using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lab_Task_03
{
    public class VehicleManager
    {
        public void ManageVehicle(Vehicle vehicle)
        {
            vehicle.Start();

            if (vehicle is DriveableVehicle driveable)
            {
                driveable.Accelerate();
            }

            vehicle.Stop();
        }
    }
}
