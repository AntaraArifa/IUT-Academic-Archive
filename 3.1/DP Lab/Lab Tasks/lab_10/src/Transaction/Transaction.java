package Transaction;

import java.time.LocalDateTime;

public class Transaction {
    private String accountNumber;
    private String type;
    private int amount;
    private LocalDateTime timestamp;

    public Transaction(String accountNumber, String type, int amount) {
        this.accountNumber = accountNumber;
        this.type = type;
        this.amount = amount;
        this.timestamp = LocalDateTime.now();
    }

    public String getAccountNumber() {
        return accountNumber;
    }

    public String getType() {
        return type;
    }

    public int getAmount() {
        return amount;
    }

    public LocalDateTime getTimestamp() {
        return timestamp;
    }

    @Override
    public String toString() {
        return timestamp + " - Account: " + accountNumber + " - " + type + ": $" + amount;
    }
}
