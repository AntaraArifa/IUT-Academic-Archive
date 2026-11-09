package RidetypeBehaviour;

public class BikeRide implements RideType {
    public double calculateFare(double distance) {
        return distance * 5;
    }

    public String getTypeName() {
        return "Bike Ride";
    }
}
