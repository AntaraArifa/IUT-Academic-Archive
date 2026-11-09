public interface EncryptionStandard {
    byte[] encrypt(String data, String key) throws Exception;
    String decrypt(byte[] data, String key) throws Exception;
}
