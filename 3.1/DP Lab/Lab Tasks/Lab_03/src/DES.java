import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;

public class DES implements EncryptionStandard {
    private SecretKey key;
    private final int KEY_SIZE = 56; // DES uses a key size of 56 bits
    private Cipher encryptionCipher;

    @Override
    public byte[] encrypt(String data, String key) throws Exception {
        byte[] dataInBytes = data.getBytes();
        encryptionCipher = Cipher.getInstance("DES");
        encryptionCipher.init(Cipher.ENCRYPT_MODE, this.key);
        byte[] encryptedBytes = encryptionCipher.doFinal(dataInBytes);
        return encryptedBytes;
    }

    @Override
    public String decrypt(byte[] data, String key) throws Exception {
        Cipher decryptionCipher = Cipher.getInstance("DES");
        decryptionCipher.init(Cipher.DECRYPT_MODE, this.key);
        byte[] decryptedBytes = decryptionCipher.doFinal(data);
        return new String(decryptedBytes);
    }
}
