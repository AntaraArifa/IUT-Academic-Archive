public interface SocialMediaPlatform {
    void fetchNotifications();
    void markAsRead(String notificationId);
    void markAsUnread(String notificationId);
    void deleteNotification(String notificationId);
}
