package Condiment;

import Beverage.Beverage;

public class Milk implements Condiment {
    public String getDescription() {
        return "Milk";
    }

    public double cost() {
        return 45;
    }
}