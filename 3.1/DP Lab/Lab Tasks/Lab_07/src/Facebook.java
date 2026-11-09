public class Facebook implements SocialMediaPlatform {
    @Override
    public void fetchNotifications() {
        System.out.println("Fetching Facebook notifications");
    }

    @Override
    public void markAsRead(String notificationId) {
        System.out.println("Facebook notification " + notificationId + " marked as read");
    }

    @Override
    public void markAsUnread(String notificationId) {
        System.out.println("Facebook notification " + notificationId + " marked as unread");
    }

    @Override
    public void deleteNotification(String notificationId) {
        System.out.println("Facebook notification " + notificationId + " deleted");
    }
}
