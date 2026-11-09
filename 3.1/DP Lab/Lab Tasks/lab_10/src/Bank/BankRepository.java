package Bank;

import Transaction.TransactionRepository;
import java.util.HashMap;
import java.util.Map;

public class BankRepository {
    private Map<String, BankAccount> accounts = new HashMap<>();

    public void addAccount(BankAccount account) {
        accounts.put(account.getAccountNumber(), account);
    }

    public BankAccount getAccount(String accountId) {
        return accounts.get(accountId);
    }

    public void printTransactionHistory(String accountId) {
        BankAccount account = accounts.get(accountId);
        if (account != null) {
            System.out.println("Transaction History for " + accountId + ":");
            account.getTransactionHistory().forEach(System.out::println);
        } else {
            System.out.println("Account not found.");
        }
    }
}
