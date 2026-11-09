package PaymentBehaviour;

public class CreditCard implements PaymentMethod {
    @Override
    public void processPayment(double amount) {
        System.out.println("Payment of " + amount + " processed through Credit Card.");
    }
}
