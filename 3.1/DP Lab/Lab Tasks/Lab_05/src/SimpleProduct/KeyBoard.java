package SimpleProduct;

import Interface.IProduct;

public class KeyBoard implements IProduct {

    private String name;
    private double price;
    private String description;

    public KeyBoard(String name, double price, String description){
        this.name = name;
        this.price = price;
        this.description = description;
    }

    public double getPrice(){
        return this.price;
    }

    public String getName(){
        return this.name;
    }

    public String getDescription(){
        return this.description;
    }
}