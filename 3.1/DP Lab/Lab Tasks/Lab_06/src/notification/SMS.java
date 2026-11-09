package notification;
public class SMS implements Notification {
    @Override
    public void notify(String message) {
        System.out.println("Sending SMS: " + message);
    }
}