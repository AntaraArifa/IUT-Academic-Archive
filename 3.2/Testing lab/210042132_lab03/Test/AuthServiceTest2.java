import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.CsvSource;

public class AuthServiceTest2 {

    private AuthService authService = new AuthService();

    @ParameterizedTest(name = "{index} => username={0}, password={1}, expected={2}")
    @CsvSource({
            "john, secret123, true",
            "alice, pass, false",
            "'', abcdef, false",
            "bob, , false",
            "tom, 12345, false",
            "jane, 1234567890123456789, false",
            "mark, password1, true"
    })
    void test_isValidUser_withVariousInputs(String username, String password, boolean expected) {
        boolean actual = authService.isValidUser(username, password);
        Assertions.assertEquals(expected, actual);
    }
}
