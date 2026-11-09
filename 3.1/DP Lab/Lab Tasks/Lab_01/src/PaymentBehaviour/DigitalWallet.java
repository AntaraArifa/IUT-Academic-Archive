package PaymentBehaviour;

public class DigitalWallet implements PaymentMethod {
    @Override
    public void processPayment(double amount) {
        System.out.println("Payment of " + amount + " processed through DigitalWallet.");
    }
}