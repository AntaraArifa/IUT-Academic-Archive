package SimpleProduct;

import Interface.IProduct;

public class Mouse implements IProduct {

    private String name;
    private double price;
    private String description;

    public Mouse(String name, double price, String description){
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