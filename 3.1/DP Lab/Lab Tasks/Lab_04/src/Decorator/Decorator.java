package Decorator;

import Beverage.Beverage;
import Condiment.Condiment;
import java.util.ArrayList;
import java.util.List;

public class Decorator implements Beverage {
    private Beverage beverage;
    private List<Condiment> condiments = new ArrayList<>();

    public Decorator(Beverage beverage) {
        this.beverage = beverage;
    }

    public void addCondiment(Condiment condiment) {
        condiments.add(condiment);
    }

    @Override
    public String getDescription() {
        StringBuilder description = new StringBuilder(beverage.getDescription());
        for (Condiment condiment : condiments) {
            description.append(", ").append(condiment.getDescription());
        }
        return description.toString();
    }

    @Override
    public double cost() {
        double totalCost = beverage.cost();
        for (Condiment condiment : condiments) {
            totalCost += condiment.cost();
        }
        return totalCost;
    }
}
