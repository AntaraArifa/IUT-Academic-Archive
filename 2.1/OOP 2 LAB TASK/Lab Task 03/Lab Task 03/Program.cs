using System;

namespace Lab_Task_03
{
    class Driver
    {
        static void Main(string[] args)
        {
            VehicleManager manager = new VehicleManager();

            Vehicle car = new Car("Petrol");
            Vehicle bus = new Bus("Diesel");
            Vehicle bicycle = new Bicycle("None");

            manager.ManageVehicle(car);
            Console.WriteLine("===========");

            manager.ManageVehicle(bus);
            Console.WriteLine("===========");

            manager.ManageVehicle(bicycle);

        }
    }
}
