package NotificationBehaviour;

public class SMS implements SendNotification {
    @Override
    public void sendNotification(String message) {
        System.out.println("SMS Notification: " + message);
    }
}
