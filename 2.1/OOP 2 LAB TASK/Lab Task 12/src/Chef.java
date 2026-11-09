import java.util.Queue;
import java.util.Random;

class Chef extends Thread {
    private static int idCounter = 1;
    private int chefId;
    private Queue<String> orderQueue;
    private Queue<String> cookedFoodQueue;

    public Chef(Queue<String> orderQueue, Queue<String> cookedFoodQueue) {
        this.chefId = idCounter++;
        this.orderQueue = orderQueue;
        this.cookedFoodQueue = cookedFoodQueue;
    }

    @Override
    public void run() {
        try {
            while (true) {
                String order = takeOrder();
                if (order == null) {
                    break; // No more orders
                }

                prepareDish(order);
            }
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

    private String takeOrder() {
        return orderQueue.poll(); // Take an order from the order queue
    }

    private void prepareDish(String order) throws InterruptedException {
        System.out.println("Chef " + chefId + " is preparing " + order);

        // Simulate cooking time
        Thread.sleep(new Random().nextInt(2000));

        System.out.println("Chef " + chefId + " has prepared " + order);

        // Queue the prepared food in the cooked food queue
        cookedFoodQueue.add(order);
    }
}
