public class PrimeNumberChecker {
    public static boolean isPrime(Object num) throws IllegalArgumentException {
        if (!(num instanceof Integer || num instanceof Long)) {
            throw new IllegalArgumentException("Input must be an Integer or Long.");
        }

        long n = (num instanceof Integer) ? ((Integer) num).longValue() : (Long) num;

        if (n < 2 || n > 1000000000000L) {
            throw new IllegalArgumentException("Input must be in the range 2..1000000000000.");
        }

        for (long i = 2; i <= Math.sqrt(n); i++) {
            if (n % i == 0) {
                return false;
            }
        }
        return true;
    }
}
