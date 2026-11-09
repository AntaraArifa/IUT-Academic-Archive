package Condiment;

import Beverage.Beverage;

public class WhippedCream implements Condiment {
    public String getDescription() {
        return "Whipped Cream";
    }

    public double cost() {
        return 60;
    }
}