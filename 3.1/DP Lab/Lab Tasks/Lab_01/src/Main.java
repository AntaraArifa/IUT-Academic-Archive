import Domain.Rider;
import Domain.Driver;
import Event.Trip;
import NotificationBehaviour.NotificationService;
import PaymentBehaviour.CreditCard;
import PaymentBehaviour.DigitalWallet;
import PaymentBehaviour.PayPal;
import PaymentBehaviour.PaymentMethod;
import RidetypeBehaviour.*;

import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        createRider(scanner);
    }

    private static void createRider(Scanner scanner) {
        System.out.println("Enter Rider ID:");
        int riderId = scanner.nextInt();
        scanner.nextLine();

        System.out.println("Enter Rider Name:");
        String riderName = scanner.nextLine();

        PaymentMethod paymentMethod = choosePaymentMethod(scanner);

        Rider rider = new Rider(riderId, riderName, paymentMethod);

        System.out.println("Enter Pickup Location:");
        String pickupLocation = scanner.nextLine();

        System.out.println("Enter Drop-Off Location:");
        String dropOffLocation = scanner.nextLine();

        System.out.println("Enter Distance (in kilometers):");
        double distance = scanner.nextDouble();
        scanner.nextLine();

        RideType selectedRideType = chooseRideType(scanner, distance);

        Trip trip = new Trip(1, selectedRideType, "Requested", distance);
        trip.setPickupLocation(pickupLocation);
        trip.setDropOffLocation(dropOffLocation);
        trip.setRider(rider);

        NotificationService notificationService = new NotificationService();
        rider.requestRide(trip, new RideService());

        System.out.println("Initial fare: " + trip.calculateFare());

        // Option to change ride type
        System.out.println("Would you like to change the ride type? (yes/no)");
        String changeRide = scanner.nextLine();
        if (changeRide.equalsIgnoreCase("yes")) {
            RideType newRideType = chooseRideType(scanner, distance);
            trip.setRideType(newRideType);
            System.out.println("Updated fare: " + trip.calculateFare());
        }

        // Rider rates the driver
        System.out.println("Enter Driver ID to rate:");
        int driverId = scanner.nextInt();
        scanner.nextLine();

        System.out.println("Enter Driver Rating (1 to 5):");
        int driverRating = scanner.nextInt();
        scanner.nextLine();

        Driver driver = new Driver(driverId, "Sample Driver", "Unknown");
        rider.rateDriver(driver, driverRating);

        // Option to change payment method
        System.out.println("Would you like to change the payment method? (yes/no)");
        String changePayment = scanner.nextLine();
        if (changePayment.equalsIgnoreCase("yes")) {
            PaymentMethod newPaymentMethod = choosePaymentMethod(scanner);
            rider.changePaymentMethod(newPaymentMethod);
        }

        rider.makePayment(trip.calculateFare());
        System.out.println("Rider has made payment of: " + trip.calculateFare());
    }

    private static PaymentMethod choosePaymentMethod(Scanner scanner) {
        System.out.println("Enter Payment Method (1 for Credit Card, 2 for PayPal, 3 for Digital Wallet):");
        int paymentChoice = scanner.nextInt();
        scanner.nextLine();

        switch (paymentChoice) {
            case 1:
                return new CreditCard();
            case 2:
                return new PayPal();
            case 3:
                return new DigitalWallet();
            default:
                System.out.println("Invalid choice, defaulting to Credit Card.");
                return new CreditCard();
        }
    }

    private static RideType chooseRideType(Scanner scanner, double distance) {
        System.out.println("Enter Ride Type (1 for Bike Ride, 2 for Carpool, 3 for Luxury Ride):");
        int rideTypeChoice = scanner.nextInt();
        scanner.nextLine();

        switch (rideTypeChoice) {
            case 1:
                return new BikeRide();
            case 2:
                return new Carpool();
            case 3:
                return new LuxuryRide();
            default:
                System.out.println("Invalid choice, defaulting to Bike Ride.");
                return new BikeRide();
        }
    }
}
