package Command;

import Bank.BankAccount;
import Event.EventBus;
import Event.TransactionEvent;
import Transaction.Transaction;
import Transaction.TransactionRepository;

public class TransferCommand implements Command {
    private BankAccount fromAccount;
    private BankAccount toAccount;
    private int amount;
    private EventBus eventBus;
    private TransactionRepository transactionRepository;

    public TransferCommand(BankAccount fromAccount, BankAccount toAccount, int amount, EventBus eventBus, TransactionRepository repository) {
        this.fromAccount = fromAccount;
        this.toAccount = toAccount;
        this.amount = amount;
        this.eventBus = eventBus;
        this.transactionRepository = repository;
    }

    @Override
    public void doAction() {
        if (fromAccount.getBalance() >= amount) {
            fromAccount.withdraw(amount);
            toAccount.deposit(amount);
            Transaction transaction = new Transaction(fromAccount.getAccountNumber(), "Transfer", amount);
            eventBus.publish(new TransactionEvent(transaction, transactionRepository));
        } else {
            System.out.println("Transfer failed: Insufficient funds.");
        }
    }
}
