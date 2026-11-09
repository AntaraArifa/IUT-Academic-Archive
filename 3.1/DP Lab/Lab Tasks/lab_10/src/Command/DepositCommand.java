package Command;

import Bank.BankAccount;
import Event.EventBus;
import Event.TransactionEvent;
import Transaction.Transaction;
import Transaction.TransactionRepository;

public class DepositCommand implements Command {
    private BankAccount account;
    private int amount;
    private EventBus eventBus;
    private TransactionRepository transactionRepository;

    public DepositCommand(BankAccount account, int amount, EventBus eventBus, TransactionRepository repository) {
        this.account = account;
        this.amount = amount;
        this.eventBus = eventBus;
        this.transactionRepository = repository;
    }

    @Override
    public void doAction() {
        account.deposit(amount);
        Transaction transaction = new Transaction(account.getAccountNumber(), "Deposit", amount);
        eventBus.publish(new TransactionEvent(transaction, transactionRepository));
    }
}
