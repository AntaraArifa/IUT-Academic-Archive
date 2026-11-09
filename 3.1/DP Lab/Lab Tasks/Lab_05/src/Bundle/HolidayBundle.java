package Bundle;

import SimpleProduct.KeyBoard;
import SimpleProduct.Laptop;
import SimpleProduct.Phone;

public class HolidayBundle extends CompositeProduct{
    public HolidayBundle(){
        build();
    }

    public void build(){
        addProduct(new Laptop("Gigabyte G5 GD", 1000, "Laptop"));
        addProduct(new Phone("Xiaomi 11 Lite", 800, "Phone"));
        addProduct(new KeyBoard("Logitech KeyBoard", 100, "Keyboard"));
    }
}