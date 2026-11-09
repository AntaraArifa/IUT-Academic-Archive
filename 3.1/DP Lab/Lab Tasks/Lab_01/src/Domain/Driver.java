package Domain;

import Event.Trip;
import NotificationBehaviour.NotificationService;
import NotificationBehaviour.SendNotification;

public class Driver extends domain.User {
    public String vehicleType;
    public boolean availability;

    public Driver(int id, String name, String vehicleType) {
        this.id = id;
        this.name = name;
        this.vehicleType = vehicleType;
        this.availability = true;
    }

    public void acceptRide(Trip trip, SendNotification notificationMethod) {
        trip.assignDriver(this, notificationMethod);
        this.availability = false;
        NotificationService.sendNotification(notificationMethod, "Driver assigned: " + this.name);
    }

    public void startTrip(Trip trip, SendNotification notificationMethod) {
        trip.startTrip(notificationMethod);
        NotificationService.sendNotification(notificationMethod, "Trip started by: " + this.name);
    }

    public void completeTrip(Trip trip, SendNotification notificationMethod) {
        trip.completeTrip(notificationMethod);
        this.availability = true;
        NotificationService.sendNotification(notificationMethod, "Trip completed by: " + this.name);
    }

    public String getName() {
        return this.name;
    }
}
