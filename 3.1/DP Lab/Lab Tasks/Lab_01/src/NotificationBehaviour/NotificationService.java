package NotificationBehaviour;

public class NotificationService {
    public static void sendNotification(SendNotification notificationMethod, String message) {
        notificationMethod.sendNotification(message);
    }
}
