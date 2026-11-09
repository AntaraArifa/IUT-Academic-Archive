import Bundle.LaptopBundle;
import Interface.IProduct;
import SimpleProduct.Laptop;

public class Main {
    public static void main(String[] args) {
        System.out.println("Welcome to IUTians' Tech!");

        IProduct pd1 = new Laptop("Lenovo Ideapad", 1000, "Laptop");
        System.out.println("Name: " + pd1.getName() + " Price: " + pd1.getPrice() + " Description: " + pd1.getPrice());

        System.out.println("\n\n");
        IProduct pd = new LaptopBundle();
        System.out.println("In Laptop bundle we have the following products: \n");
        System.out.println(pd.getDescription());
        System.out.println(pd.getName());
        System.out.println("Total price : " + pd.getPrice());
    }
}