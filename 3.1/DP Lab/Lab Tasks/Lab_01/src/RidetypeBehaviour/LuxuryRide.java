package RidetypeBehaviour;

public class LuxuryRide implements RideType {
    public double calculateFare(double distance) {
        return distance * 15;
    }

    public String getTypeName() {
        return "Luxury Ride";
    }
}
