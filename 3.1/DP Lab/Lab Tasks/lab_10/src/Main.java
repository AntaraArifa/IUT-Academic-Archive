
import Bank.BankAccount;
import Bank.BankRepository;
import Command.CommandInvoker;
import Command.CreateAccountCommand;
import Command.DepositCommand;
import Command.WithdrawCommand;
import Command.TransferCommand;
import Event.EventBus;
import Transaction.TransactionRepository;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        // Initialize the necessary components
        BankRepository bankRepo = new BankRepository();
        EventBus eventBus = new EventBus();  // Create EventBus instance
        TransactionRepository transactionRepo = new TransactionRepository(); // Create TransactionRepository instance
        CommandInvoker invoker = new CommandInvoker();
        Scanner scanner = new Scanner(System.in);

        while (true) {
            System.out.println("\nBank System Menu:");
            System.out.println("1. Create Account");
            System.out.println("2. Deposit Money");
            System.out.println("3. Withdraw Money");
            System.out.println("4. Transfer Money");
            System.out.println("5. View Transaction History");
            System.out.println("6. Exit");
            System.out.print("Enter choice: ");
            int choice = scanner.nextInt();

            switch (choice) {
                case 1:
                    System.out.print("Enter Account Number: ");
                    String accNumber = scanner.next();
                    System.out.print("Enter Initial Balance: ");
                    int balance = scanner.nextInt();
                    BankAccount newAccount = new BankAccount(accNumber, balance);
                    bankRepo.addAccount(newAccount);
                    invoker.executeCommand(new CreateAccountCommand(newAccount));
                    break;

                case 2:
                    System.out.print("Enter Account Number: ");
                    accNumber = scanner.next();
                    BankAccount account = bankRepo.getAccount(accNumber);
                    if (account != null) {
                        System.out.print("Enter Deposit Amount: ");
                        int amount = scanner.nextInt();
                        invoker.executeCommand(new DepositCommand(account, amount, eventBus, transactionRepo));
                    } else {
                        System.out.println("Account not found.");
                    }
                    break;

                case 3:
                    System.out.print("Enter Account Number: ");
                    accNumber = scanner.next();
                    account = bankRepo.getAccount(accNumber);
                    if (account != null) {
                        System.out.print("Enter Withdrawal Amount: ");
                        int amount = scanner.nextInt();
                        invoker.executeCommand(new WithdrawCommand(account, amount, eventBus, transactionRepo));
                    } else {
                        System.out.println("Account not found.");
                    }
                    break;

                case 4:
                    System.out.print("Enter Sender Account Number: ");
                    String fromAcc = scanner.next();
                    System.out.print("Enter Receiver Account Number: ");
                    String toAcc = scanner.next();
                    BankAccount sender = bankRepo.getAccount(fromAcc);
                    BankAccount receiver = bankRepo.getAccount(toAcc);
                    if (sender != null && receiver != null) {
                        System.out.print("Enter Transfer Amount: ");
                        int amount = scanner.nextInt();
                        invoker.executeCommand(new TransferCommand(sender, receiver, amount, eventBus, transactionRepo));
                    } else {
                        System.out.println("One or both accounts not found.");
                    }
                    break;

                case 5:
                    System.out.print("Enter Account Number: ");
                    accNumber = scanner.next();
                    bankRepo.printTransactionHistory(accNumber);
                    break;

                case 6:
                    System.out.println("Exiting...");
                    return;

                default:
                    System.out.println("Invalid choice. Try again.");
            }
        }
    }
}