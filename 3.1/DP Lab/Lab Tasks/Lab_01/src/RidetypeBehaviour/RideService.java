package RidetypeBehaviour;

import Domain.Rider;
import Event.Trip;

public class RideService {
    public void requestRide(Rider rider, Trip trip) {
        System.out.println("Ride requested by: " + rider.name);
        System.out.println("Ride type: " + trip.rideType.getTypeName());
        System.out.println("Initial fare: " + trip.calculateFare());
    }
}
