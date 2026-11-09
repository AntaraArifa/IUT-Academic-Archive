import java.util.ArrayList;
import java.util.List;

public class SocialMediaFacade {
    private final List<SocialMediaPlatform> platforms;

    public SocialMediaFacade() {
        platforms = new ArrayList<>();
        platforms.add(new Twitter());
        platforms.add(new Facebook());
        platforms.add(new LinkedIn());
        platforms.add(new Instagram());
    }

    public void fetchAllNotifications() {
        for (SocialMediaPlatform platform : platforms) {
            platform.fetchNotifications();
        }
    }

    public void markNotificationAsRead(String platformName, String notificationId) {
        SocialMediaPlatform platform = getPlatform(platformName);
        if (platform != null) {
            platform.markAsRead(notificationId);
        } else {
            System.out.println("Platform " + platformName + " not found");
        }
    }

    public void markNotificationAsUnread(String platformName, String notificationId) {
        SocialMediaPlatform platform = getPlatform(platformName);
        if (platform != null) {
            platform.markAsUnread(notificationId);
        } else {
            System.out.println("Platform " + platformName + " not found");
        }
    }

    public void deleteNotification(String platformName, String notificationId) {
        SocialMediaPlatform platform = getPlatform(platformName);
        if (platform != null) {
            platform.deleteNotification(notificationId);
        } else {
            System.out.println("Platform " + platformName + " not found");
        }
    }

    private SocialMediaPlatform getPlatform(String platformName) {
        for (SocialMediaPlatform platform : platforms) {
            if (platform.getClass().getSimpleName().equalsIgnoreCase(platformName)) {
                return platform;
            }
        }
        return null;
    }
}
