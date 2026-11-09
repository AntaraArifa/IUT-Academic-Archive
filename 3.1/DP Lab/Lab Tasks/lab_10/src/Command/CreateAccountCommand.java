package Command;

import Bank.BankAccount;

public class CreateAccountCommand implements Command {
    private BankAccount account;

    public CreateAccountCommand(BankAccount account) {
        this.account = account;
    }

    @Override
    public void doAction() {
        System.out.println("Creating new account with balance: " + account.getBalance());
    }
}
