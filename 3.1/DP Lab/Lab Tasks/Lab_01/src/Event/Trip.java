package Event;

import Domain.Driver;
import Domain.Rider;
import NotificationBehaviour.NotificationService;
import NotificationBehaviour.SendNotification;
import RidetypeBehaviour.RideType;

public class Trip {
    public int id;
    public String pickupLocation;
    public String dropOffLocation;
    public RideType rideType;
    public String status;
    public double fare;
    public double distance;
    public Rider rider;
    public Driver driver;

    public Trip(int id, RideType rideType, String status, double distance) {
        this.id = id;
        this.rideType = rideType;
        this.status = status;
        this.distance = distance;
        this.fare = rideType.calculateFare(distance);
    }

    public double calculateFare() {
        return rideType.calculateFare(distance);
    }

    public void assignDriver(Driver driver, SendNotification notificationMethod) {
        this.driver = driver;
        this.status = "Driver Assigned";
        NotificationService.sendNotification(notificationMethod, "Driver assigned to trip: " + this.id);
    }

    public void startTrip(SendNotification notificationMethod) {
        this.status = "In Progress";
        NotificationService.sendNotification(notificationMethod, "Trip started: " + this.id);
    }

    public void completeTrip(SendNotification notificationMethod) {
        this.status = "Completed";
        NotificationService.sendNotification(notificationMethod, "Trip completed: " + this.id);
        rider.makePayment(this.fare);
    }

    public void setPickupLocation(String pickupLocation) {
        this.pickupLocation = pickupLocation;
    }

    public void setDropOffLocation(String dropOffLocation) {
        this.dropOffLocation = dropOffLocation;
    }

    public void setRider(Rider rider) {
        this.rider = rider;
    }

    public void setRideType(RideType rideType) {
        this.rideType = rideType;
        this.fare = rideType.calculateFare(this.distance);
    }
}
