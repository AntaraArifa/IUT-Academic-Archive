import adapter.Adapter;
import notification.Email;
import notification.Notification;
import notification.SMS;
import thirdparty.EPostalMail;

public class Main {
    public static void main(String[] args) {
        Notification sms = new SMS();
        sms.notify("Hello via SMS!");

        Notification email = new Email();
        email.notify("Hello via Email!");

        EPostalMail ePostalMail =  new EPostalMail();

        Notification postalMail = new Adapter(ePostalMail,"123 Main St", "98765");
        postalMail.notify("Hello via Postal Mail!");
    }
}
