import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        EncryptionStandard encryptionStandard = null;

        System.out.println("Select Encryption Algorithm: 1. AES 2. DES 3. Caesar Cipher");
        int choice = scanner.nextInt();
        scanner.nextLine();

        try {
            switch (choice) {
                case 1:
                    encryptionStandard = new AES();
                    break;
                case 2:
                    encryptionStandard = new DES();
                    break;
                case 3:
                    encryptionStandard = new CaesarCipher();
                    break;
                default:
                    System.out.println("Invalid choice");
                    return;
            }

            System.out.println("Enter the key (for AES and DES, this can be any string, but it will be used internally; for Caesar Cipher, it should be an integer shift value):");
            String key = scanner.nextLine();

            System.out.println("Enter the file path to encrypt:");
            String filePath = scanner.nextLine();

            String data = new String(Files.readAllBytes(Paths.get(filePath)));
            byte[] encryptedData = encryptionStandard.encrypt(data, key);
            Files.write(Paths.get(filePath + ".enc"), encryptedData);

            String decryptedData = encryptionStandard.decrypt(encryptedData, key);
            Files.write(Paths.get(filePath + ".dec"), decryptedData.getBytes());

            System.out.println("Encryption and Decryption completed successfully.");
        } catch (Exception e) {
            System.err.println("Error: " + e.getMessage());
            e.printStackTrace();
        }

        scanner.close();
    }
}
