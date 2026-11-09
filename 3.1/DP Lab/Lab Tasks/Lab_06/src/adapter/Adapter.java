package adapter;

import notification.Notification;
import thirdparty.EPostalMail;

public class Adapter implements Notification {
    private EPostalMail postalMailService;
    private String address;
    private String zipCode;

    public Adapter(EPostalMail postalMailService, String address, String zipCode) {
        this.postalMailService = postalMailService;
        this.address = address;
        this.zipCode = zipCode;
    }

    @Override
    public void notify(String message) {
        postalMailService.sendMail(message, address, zipCode);
    }

}