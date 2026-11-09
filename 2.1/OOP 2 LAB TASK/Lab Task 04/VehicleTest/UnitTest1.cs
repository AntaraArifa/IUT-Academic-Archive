using Lab_Task_04;
using NUnit.Framework;

namespace VehicleTest
{
    public class Tests
    {
        [SetUp]
        public void Setup()
        {
        }

        [Test]
        public void TestSatisfySedan()
        {
            Trip trip = new Trip(VehicleType.SEDAN, 15, 20, 2);

            bool canTakeTrip = trip.CanTakeTrip();

            Assert.IsTrue(canTakeTrip);
        }

        [Test]
        public void TestSatisfySevenSeater()
        {

            Trip trip = new Trip(VehicleType.SEVEN_SEATER, 15, 20, 5);

            bool canTakeTrip = trip.CanTakeTrip();

            Assert.IsTrue(canTakeTrip);
        }
        [Test]
        public void TestSatisfyMotorbike()
        {

            Trip trip = new Trip(VehicleType.MOTOR_BIKE, 5, 10, 1);

            bool canTakeTrip = trip.CanTakeTrip();

            Assert.IsTrue(canTakeTrip);
        }
        [Test]
        public void TestPerHeadFairCalculationForSevenSeater()
        {

            Trip trip = new Trip(VehicleType.SEVEN_SEATER, 20, 30, 6);

            int perHeadFare = trip.PerHeadFare();

            Assert.AreEqual(100, perHeadFare);
        }
        [Test]
        public void TestPerHeadFairCalculationForMotorbike()
        {
           
            Trip trip = new Trip(VehicleType.MOTOR_BIKE, 5, 20, 1);

            int perHeadFare = trip.PerHeadFare();

            Assert.AreEqual(100, perHeadFare);
        }
        [Test]
        public void TestPerHeadFairCalculationForSedan()
        {
            
            Trip trip = new Trip(VehicleType.SEDAN, 25, 60, 5);

            int perHeadFare = trip.PerHeadFare();

            Assert.AreEqual(184, perHeadFare);
        }

    }
}