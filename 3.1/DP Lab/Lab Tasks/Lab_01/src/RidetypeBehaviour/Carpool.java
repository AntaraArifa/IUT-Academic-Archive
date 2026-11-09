package RidetypeBehaviour;

public class Carpool implements RideType {
    public double calculateFare(double distance) {
        return distance * 8;
    }

    public String getTypeName() {
        return "Carpool";
    }
}
