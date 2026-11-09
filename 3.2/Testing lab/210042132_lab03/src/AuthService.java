public class AuthService {
    public boolean isValidUser(String username, String password) {
        return username != null && password != null && password.length() >=
                6 && password.length()<=18 && this.containsDigit(password);
    }
    public boolean containsDigit(String input) {
        for (char c : input.toCharArray())
            if (Character.isDigit(c)) return true;
        return false;
    }
    public String generateToken(String username) {
        return "TOKEN_" + username.toUpperCase();
    }
    public void sendLoginNotification(NotificationService
                                              notificationService, String username) {
        String message = "User " + username + " has logged in.";

        notificationService.sendEmail(username, message);
    }
}