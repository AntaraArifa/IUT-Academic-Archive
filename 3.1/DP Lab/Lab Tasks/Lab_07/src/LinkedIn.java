public class LinkedIn implements SocialMediaPlatform {
    @Override
    public void fetchNotifications() {
        System.out.println("Fetching LinkedIn notifications");
    }

    @Override
    public void markAsRead(String notificationId) {
        System.out.println("LinkedIn notification " + notificationId + " marked as read");
    }

    @Override
    public void markAsUnread(String notificationId) {
        System.out.println("LinkedIn notification " + notificationId + " marked as unread");
    }

    @Override
    public void deleteNotification(String notificationId) {
        System.out.println("LinkedIn notification " + notificationId + " deleted");
    }
}
