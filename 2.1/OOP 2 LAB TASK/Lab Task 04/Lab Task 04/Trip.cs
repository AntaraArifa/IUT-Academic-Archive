using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lab_Task_04
{
    public class Trip
    {
        private VehicleType vehicleType;
        private int distanceKM;
        private int timeMinutes;
        private int numberOfPassengers;

        public Trip(VehicleType vehicleType, int distanceKM, int timeMinutes, int numberOfPassengers)
        {
            this.vehicleType = vehicleType;
            this.distanceKM = distanceKM;
            this.timeMinutes = timeMinutes;
            this.numberOfPassengers = numberOfPassengers;
        }

        public int PerHeadFare()
        {
            int fare = -1;
            switch (vehicleType)
            {
                case VehicleType.SEDAN:
                    fare = (50 + distanceKM * 30 + timeMinutes * 2) / numberOfPassengers;
                    break;
                case VehicleType.MOTOR_BIKE:
                    fare = Math.Max(25, distanceKM * 20) / numberOfPassengers;
                    break;
                default:
                    if (distanceKM < 10)
                        fare = 300 / numberOfPassengers;
                    else
                        fare = distanceKM * 30 / numberOfPassengers;
                    break;
            }
            return fare;
        }

        public bool CanTakeTrip()
        {
            if (numberOfPassengers < 1)
                return false;

            switch (vehicleType)
            {
                case VehicleType.SEDAN:
                    return numberOfPassengers <= 4 && distanceKM <= 25;
                case VehicleType.SEVEN_SEATER:
                    return numberOfPassengers <= 7 && distanceKM >= 10;
                default:
                    return numberOfPassengers <= 1 && distanceKM <= 10;
            }
        }
    }
}
