package Command;

public class CommandInvoker {
    public void executeCommand(Command command) {
        command.doAction();
    }
}
