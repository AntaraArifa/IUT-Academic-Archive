package thirdparty;
public class EPostalMail {
    public void sendMail(String message, String address, String zipCode) {
        System.out.println("Sending Postal Mail to " + address + " (" + zipCode + "): " + message);
    }
}