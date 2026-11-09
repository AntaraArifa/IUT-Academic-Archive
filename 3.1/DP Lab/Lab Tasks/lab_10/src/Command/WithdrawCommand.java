package Command;

import Bank.BankAccount;
import Event.EventBus;
import Event.TransactionEvent;
import Transaction.Transaction;
import Transaction.TransactionRepository;

public class WithdrawCommand implements Command {
    private BankAccount account;
    private int amount;
    private EventBus eventBus;
    private TransactionRepository transactionRepository;

    public WithdrawCommand(BankAccount account, int amount, EventBus eventBus, TransactionRepository repository) {
        this.account = account;
        this.amount = amount;
        this.eventBus = eventBus;
        this.transactionRepository = repository;
    }

    @Override
    public void doAction() {
        if (account.getBalance() >= amount) {
            account.withdraw(amount);
            Transaction transaction = new Transaction(account.getAccountNumber(), "Withdraw", amount);
            eventBus.publish(new TransactionEvent(transaction, transactionRepository));
        } else {
            System.out.println("Withdrawal failed: Insufficient funds.");
        }
    }
}
