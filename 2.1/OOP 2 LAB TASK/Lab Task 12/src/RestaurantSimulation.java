import java.util.ArrayList;
import java.util.LinkedList;
import java.util.Queue;

public class RestaurantSimulation {
    public static void main(String[] args) throws InterruptedException {
        int numTables = 5;
        int numChefs = 2;
        int numWaiters = 3;
        int numCustomers = 10; // Set an appropriate value for the number of customers to be served (N)

        // Shared data structures
        Queue<String> orderQueue = new LinkedList<>();
        Queue<String> cookedFoodQueue = new LinkedList<>();
        Receptionist receptionist = new Receptionist(numTables);

        // Create threads for chefs, waiters, and customers
        ArrayList<Thread> threads = new ArrayList<>();

        for (int i = 0; i < numChefs; i++) {
            threads.add(new Chef(orderQueue, cookedFoodQueue));
        }

        for (int i = 0; i < numWaiters; i++) {
            threads.add(new Waiter(cookedFoodQueue));
        }

        for (int i = 0; i < numCustomers; i++) {
            threads.add(new Customer(orderQueue, receptionist));
        }

        // Start all threads
        for (Thread thread : threads) {
            thread.start();
        }

        // Wait for all customers to be served
        for (Thread thread : threads) {
            thread.join();
        }

        System.out.println("Simulation complete. All customers served.");
    }
}
