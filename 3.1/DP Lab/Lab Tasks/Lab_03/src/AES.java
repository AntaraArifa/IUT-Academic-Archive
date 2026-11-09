import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.crypto.spec.GCMParameterSpec;
import java.util.Base64;

public class AES implements EncryptionStandard {
    private SecretKey key;
    private final int KEY_SIZE = 128;
    private final int DATA_LENGTH = 128;
    private Cipher encryptionCipher;


    @Override
    public byte[] encrypt(String data, String key) throws Exception {
        byte[] dataInBytes = data.getBytes();
        encryptionCipher = Cipher.getInstance("AES/GCM/NoPadding");
        encryptionCipher.init(Cipher.ENCRYPT_MODE, this.key);
        byte[] encryptedBytes = encryptionCipher.doFinal(dataInBytes);
        return encryptedBytes;
    }

    @Override
    public String decrypt(byte[] data, String key) throws Exception {
        GCMParameterSpec spec = new GCMParameterSpec(DATA_LENGTH, encryptionCipher.getIV());
        Cipher decryptionCipher = Cipher.getInstance("AES/GCM/NoPadding");
        decryptionCipher.init(Cipher.DECRYPT_MODE, this.key, spec);
        byte[] decryptedBytes = decryptionCipher.doFinal(data);
        return new String(decryptedBytes);
    }
}
