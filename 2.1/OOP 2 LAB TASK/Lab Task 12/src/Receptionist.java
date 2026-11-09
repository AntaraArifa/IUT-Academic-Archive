import java.util.LinkedList;
import java.util.Queue;
import java.util.Random;

class Receptionist {
    private Queue<Integer> availableTables;

    public Receptionist(int numTables) {
        availableTables = new LinkedList<>();
        for (int i = 1; i <= numTables; i++) {
            availableTables.add(i);
        }
    }

    public synchronized void assignTable(Customer customer) throws InterruptedException {
        while (availableTables.isEmpty()) {
            wait(); // Wait if no tables are available
        }

        int assignedTable = availableTables.poll();
        System.out.println("Receptionist assigns Table " + assignedTable + " to Customer " + customer.getId());
        Thread.sleep(new Random().nextInt(2000)); // Simulate table assignment time
        System.out.println("Customer " + customer.getId() + " assigned to Table " + assignedTable);

        customer.join(); // Make the customer wait until the table is assigned
    }

    public synchronized void releaseTable(int table) {
        availableTables.add(table);
        notify(); // Notify waiting customers about the available table
    }
}
