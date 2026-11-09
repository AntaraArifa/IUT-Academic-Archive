package PaymentBehaviour;

public class PayPal implements PaymentMethod {
    @Override
    public void processPayment(double amount) {
        System.out.println("Payment of " + amount + " processed through PayPal.");
    }
}
