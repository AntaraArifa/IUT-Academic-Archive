using Microsoft.VisualBasic.FileIO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lab_Task_03
{
    public class Vehicle
    {
        public string FuelType { get; set; }

        public virtual void Start()
        {
            Console.WriteLine("Vehicle has started.");
        }

        public virtual void Stop()
        {
            Console.WriteLine("Vehicle has stopped.");
        }
    }

    class DriveableVehicle : Vehicle
    {
        public void Accelerate()
        {
            Console.WriteLine("Vehicle is accelerating.");
        }
    }

    class RideableVehicle : Vehicle
    {
        
    }

    class Car : DriveableVehicle
    {
        public Car(string fuelType)
        {
            FuelType = fuelType;
        }
    }

    class Bus : DriveableVehicle
    {
        public Bus(string fuelType)
        {
            FuelType = fuelType;
        }
    }

    class Bicycle : RideableVehicle
    {
        public Bicycle(string fuelType)
        {
            FuelType = fuelType;
        }
    }


}
