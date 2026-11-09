package Condiment;

import Beverage.Beverage;

public class Sugar implements Condiment {
    public String getDescription() {
        return "Sugar";
    }

    public double cost() {
        return 30;
    }
}