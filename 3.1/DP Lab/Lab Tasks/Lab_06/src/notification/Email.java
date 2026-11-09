package notification;
public class Email implements Notification {
    @Override
    public void notify(String message) {
        System.out.println("Sending Email: " + message);
    }
}