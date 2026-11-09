package Bank;

import Transaction.Transaction;
import java.util.ArrayList;
import java.util.List;

public class BankAccount {
    private String accountNumber;
    private int balance;
    private List<Transaction> transactionHistory;

    public BankAccount(String accountNumber, int balance) {
        this.accountNumber = accountNumber;
        this.balance = balance;
        this.transactionHistory = new ArrayList<>();
    }

    public void deposit(int amount) {
        if (amount <= 0) {
            System.out.println("Deposit amount must be positive.");
            return;
        }
        balance += amount;
        transactionHistory.add(new Transaction(accountNumber, "Deposit", amount));
        System.out.println("Deposited $" + amount + " into account " + accountNumber + ". New balance: $" + balance);
    }

    public void withdraw(int amount) {
        if (amount <= 0) {
            System.out.println("Withdrawal amount must be positive.");
            return;
        }
        if (balance >= amount) {
            balance -= amount;
            transactionHistory.add(new Transaction(accountNumber, "Withdraw", amount));
            System.out.println("Withdrew $" + amount + " from account " + accountNumber + ". New balance: $" + balance);
        } else {
            System.out.println("Insufficient funds in account " + accountNumber + "!");
        }
    }

    public String getAccountNumber() {
        return accountNumber;
    }

    public int getBalance() {
        return balance;
    }

    public List<Transaction> getTransactionHistory() {
        return transactionHistory;
    }
}
