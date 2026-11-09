package Event;

import Transaction.Transaction;
import Transaction.TransactionRepository;

public class TransactionEvent implements Event {
    private Transaction transaction;
    private TransactionRepository repository;

    public TransactionEvent(Transaction transaction, TransactionRepository repository) {
        this.transaction = transaction;
        this.repository = repository;
    }

    @Override
    public void process() {
        repository.addTransaction(transaction);
        System.out.println("Event: " + transaction + " has been recorded.");
    }
}
