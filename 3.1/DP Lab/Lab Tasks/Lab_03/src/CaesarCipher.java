public class CaesarCipher implements EncryptionStandard {
    private static final int ALPHABET_SIZE = 26;

    @Override
    public byte[] encrypt(String data, String key) throws Exception {
        int shift = Integer.parseInt(key);
        StringBuilder encrypted = new StringBuilder();
        for (char c : data.toCharArray()) {
            if (Character.isLetter(c)) {
                char base = Character.isLowerCase(c) ? 'a' : 'A';
                encrypted.append((char) ((c - base + shift) % ALPHABET_SIZE + base));
            } else {
                encrypted.append(c);
            }
        }
        return encrypted.toString().getBytes();
    }

    @Override
    public String decrypt(byte[] data, String key) throws Exception {
        int shift = Integer.parseInt(key);
        String encryptedData = new String(data);
        StringBuilder decrypted = new StringBuilder();
        for (char c : encryptedData.toCharArray()) {
            if (Character.isLetter(c)) {
                char base = Character.isLowerCase(c) ? 'a' : 'A';
                decrypted.append((char) ((c - base - shift + ALPHABET_SIZE) % ALPHABET_SIZE + base));
            } else {
                decrypted.append(c);
            }
        }
        return decrypted.toString();
    }
}
