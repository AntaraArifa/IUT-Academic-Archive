package NotificationBehaviour;

public class Email implements SendNotification {
    @Override
    public void sendNotification(String message) {
        System.out.println("Email Notification: " + message);
    }
}
