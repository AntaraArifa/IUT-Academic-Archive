package Bundle;

import SimpleProduct.KeyBoard;
import SimpleProduct.Laptop;
import SimpleProduct.Mouse;
public class LaptopBundle extends CompositeProduct{

    public LaptopBundle(){
        build();
    }

    public void build(){
        addProduct(new Laptop("MacBook Pro",1600, "Laptop"));
        addProduct(new Mouse("Meetion MT-R390", 320, "Mouse"));
        addProduct(new KeyBoard("Dell Basic Keyboard", 150, "Keyboard"));
    }
}