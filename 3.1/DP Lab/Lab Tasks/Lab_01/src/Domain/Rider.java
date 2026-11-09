package Domain;

import Event.Trip;
import PaymentBehaviour.PaymentMethod;
import RidetypeBehaviour.RideService;

public class Rider extends domain.User {
    private PaymentMethod paymentMethod;

    public Rider(int id, String name, PaymentMethod paymentMethod) {
        this.id = id;
        this.name = name;
        this.paymentMethod = paymentMethod;
    }

    public void requestRide(Trip trip, RideService rideService) {
        rideService.requestRide(this, trip);
    }

    public void makePayment(double amount) {
        paymentMethod.processPayment(amount);
    }

    public void changePaymentMethod(PaymentMethod newPaymentMethod) {
        this.paymentMethod = newPaymentMethod;
        System.out.println("Payment method changed successfully.");
    }

    public void rateDriver(Driver driver, int rating) {
        System.out.println("Rated driver " + driver.getName() + " with " + rating + " stars.");
    }
}
