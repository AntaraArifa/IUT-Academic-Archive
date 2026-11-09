package NotificationBehaviour;

public class InApp implements SendNotification {
    @Override
    public void sendNotification(String message) {
        System.out.println("In-App Notification: " + message);
    }
}
