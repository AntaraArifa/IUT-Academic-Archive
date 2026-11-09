import java.util.Queue;
import java.util.Random;

class Waiter extends Thread {
    private static int idCounter = 1;
    private int waiterId;
    private Queue<String> cookedFoodQueue;

    public Waiter(Queue<String> cookedFoodQueue) {
        this.waiterId = idCounter++;
        this.cookedFoodQueue = cookedFoodQueue;
    }

    @Override
    public void run() {
        try {
            while (true) {
                String cookedFood = serveDish();
                if (cookedFood == null) {
                    break; // No more cooked food
                }
            }
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

    private String serveDish() throws InterruptedException {
        String cookedFood = cookedFoodQueue.poll(); // Take a dish from the cooked food queue
        if (cookedFood == null) {
            return null; // No more cooked food
        }

        // Synchronize with the chef thread before serving the dish
        synchronized (Chef.class) {
            System.out.println("Waiter " + waiterId + " is serving " + cookedFood);
            Thread.sleep(new Random().nextInt(2000)); // Simulate serving time
            System.out.println("Waiter " + waiterId + " has served " + cookedFood);
        }

        return cookedFood;
    }
}
