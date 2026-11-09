public class Main {
    public static void main(String[] args) {
        SocialMediaFacade facade = new SocialMediaFacade();

        System.out.println("Fetching all notifications:");
        facade.fetchAllNotifications();
        System.out.println();

        System.out.println("Interacting with Twitter notifications:");
        facade.markNotificationAsRead("Twitter", "101");
        facade.markNotificationAsUnread("Twitter", "102");
        facade.deleteNotification("Twitter", "103");
        System.out.println();

        System.out.println("Interacting with Facebook notifications:");
        facade.markNotificationAsRead("Facebook", "201");
        facade.markNotificationAsUnread("Facebook", "202");
        facade.deleteNotification("Facebook", "203");
        System.out.println();

        System.out.println("Interacting with LinkedIn notifications:");
        facade.markNotificationAsRead("LinkedIn", "301");
        facade.markNotificationAsUnread("LinkedIn", "302");
        facade.deleteNotification("LinkedIn", "303");
        System.out.println();

        System.out.println("Interacting with Instagram notifications:");
        facade.markNotificationAsRead("Instagram", "401");
        facade.markNotificationAsUnread("Instagram", "402");
        facade.deleteNotification("Instagram", "403");
        System.out.println();

    }
}
