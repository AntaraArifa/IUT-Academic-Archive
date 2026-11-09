import Beverage.Beverage;
import Beverage.Espresso;
import Beverage.Latte;
import Beverage.Cappuccino;
import Condiment.Milk;
import Condiment.Sugar;
import Condiment.WhippedCream;
import Decorator.Decorator;

import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.println("Welcome to the Coffee Shop! Please select a beverage:");
        System.out.println("1. Espresso\n2. Latte\n3. Cappuccino");
        int choice = scanner.nextInt();

        Beverage beverage = null;
        switch (choice) {
            case 1:
                beverage = new Espresso();
                break;
            case 2:
                beverage = new Latte();
                break;
            case 3:
                beverage = new Cappuccino();
                break;
            default:
                System.out.println("Invalid choice. Defaulting to Espresso.");
                beverage = new Espresso();
        }

        Decorator decoratedBeverage = new Decorator(beverage);

        String addMoreCondiments;
        do {
            System.out.println("Would you like to add a condiment?");
            System.out.println("1. Milk\n2. Sugar\n3. Whipped Cream\n4. No more condiments");
            int condimentChoice = scanner.nextInt();

            switch (condimentChoice) {
                case 1:
                    decoratedBeverage.addCondiment(new Milk());
                    break;
                case 2:
                    decoratedBeverage.addCondiment(new Sugar());
                    break;
                case 3:
                    decoratedBeverage.addCondiment(new WhippedCream());
                    break;
                case 4:
                    addMoreCondiments = "no";
                    continue;
                default:
                    System.out.println("Invalid choice. No condiment added.");
                    break;
            }

            System.out.println("Would you like to add more condiments? (yes/no)");
            addMoreCondiments = scanner.next().toLowerCase();

        } while (!addMoreCondiments.equals("no"));
        
        System.out.println("Your order: " + decoratedBeverage.getDescription());
        System.out.println("Total cost: " + decoratedBeverage.cost() + " Tk.");

        scanner.close();
    }
}
