import java.util.Queue;
import java.util.Random;

class Customer extends Thread {
    private static int idCounter = 1;
    private int customerId;
    private Queue<String> orderQueue;
    private Receptionist receptionist;

    // List of possible dishes
    private static final String[] DISHES = {"Burger", "Pizza", "Pasta"};

    public Customer(Queue<String> orderQueue, Receptionist receptionist) {
        this.customerId = idCounter++;
        this.orderQueue = orderQueue;
        this.receptionist = receptionist;
    }

    @Override
    public void run() {
        try {
            placeOrder();
            receptionist.assignTable(this);
            System.out.println("Customer " + customerId + " is waiting for food.");
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

    private void placeOrder() {
        System.out.println("Customer " + customerId + " is placing an order.");

        // Generate a random order
        StringBuilder order = new StringBuilder("Customer " + customerId + "'s order: ");
        int numDishes = new Random().nextInt(DISHES.length) + 1;
        for (int i = 0; i < numDishes; i++) {
            order.append(DISHES[new Random().nextInt(DISHES.length)]);
            if (i < numDishes - 1) {
                order.append(", ");
            }
        }

        // Add the order to the order queue
        orderQueue.add(order.toString());

        System.out.println(order);
    }
}
