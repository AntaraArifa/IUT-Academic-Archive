package Domain;

import Event.Trip;

public class Admin {
    public int id;
    public String name;
    public String role;

    public Admin(int id, String name, String role) {
        this.id = id;
        this.name = name;
        this.role = role;
    }

    public void manageDriver(Driver driver, boolean activate) {
        driver.availability = activate;
        String status = activate ? "activated" : "deactivated";
        System.out.println("Driver " + driver.name + " has been " + status + ".");
    }

    public void manageRider(Rider rider, boolean activate) {
        System.out.println("Rider " + rider.name + " has been " + (activate ? "activated" : "deactivated") + ".");
    }

    public void viewTripHistory(Trip trip) {
        System.out.println("Trip ID: " + trip.id);
        System.out.println("Pickup Location: " + trip.pickupLocation);
        System.out.println("DropOff Location: " + trip.dropOffLocation);
        System.out.println("Ride Type: " + trip.rideType.getClass().getSimpleName());
        System.out.println("Status: " + trip.status);
        System.out.println("Fare: " + trip.fare);
        System.out.println("Distance: " + trip.distance);
        System.out.println("Domain.Driver: " + (trip.driver != null ? trip.driver.name : "Not Assigned"));
        System.out.println("Domain.Rider: " + (trip.rider != null ? trip.rider.name : "Not Assigned"));
    }

    public void handleDispute(Trip trip, String issue) {
        System.out.println("Dispute for Trip ID: " + trip.id + " - " + issue);
    }
}
