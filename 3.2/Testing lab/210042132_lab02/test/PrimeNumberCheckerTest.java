import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.Test;

public class PrimeNumberCheckerTest {

    @Test
    public void testIsPrimeNumber() {
        boolean result = PrimeNumberChecker.isPrime(2);
        assertTrue(result, "2 should be prime");
    }

    @Test
    public void testIsPrimeNumberWith47() {
        boolean result = PrimeNumberChecker.isPrime(47);
        assertTrue(result, "47 should be prime");
    }

    @Test
    public void testIsNonPrimeNumber() {
        boolean result = PrimeNumberChecker.isPrime(20);
        assertFalse(result, "20 should not be prime");
    }

    @Test
    public void testIsNonPrimeNumberWith933() {
        boolean result = PrimeNumberChecker.isPrime(933);
        assertFalse(result, "933 should not be prime");
    }

    @Test
    public void testIsNonPrimeNumberWithLargeNumber() {
        boolean result = PrimeNumberChecker.isPrime(1000000000000L);
        assertFalse(result, "1000000000000 should not be prime");
    }

    @Test
    public void testIsPrimeNumberWithInvalidInput() {
        assertThrows(IllegalArgumentException.class, () -> {
            PrimeNumberChecker.isPrime(2.5);
        }, "Should throw an exception for non-integer inputs.");
    }

    @Test
    public void testIsPrimeNumberWithLessThan2() {
        assertThrows(IllegalArgumentException.class, () -> {
            PrimeNumberChecker.isPrime(1);
        }, "Should throw an exception for numbers less than 2.");
    }

    @Test
    public void testIsPrimeNumberWithNegative() {
        assertThrows(IllegalArgumentException.class, () -> {
            PrimeNumberChecker.isPrime(-14);
        }, "Should throw an exception for negative numbers.");
    }

    @Test
    public void testIsPrimeNumberWithLargeInput() {
        assertThrows(IllegalArgumentException.class, () -> {
            PrimeNumberChecker.isPrime(1000000000001L);
        }, "Should throw an exception for numbers larger than 1000000000000.");
    }
}
