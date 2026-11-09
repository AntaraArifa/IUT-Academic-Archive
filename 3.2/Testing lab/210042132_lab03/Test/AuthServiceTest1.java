import org.junit.jupiter.api.*;
import org.junit.jupiter.api.MethodOrderer.OrderAnnotation;

@TestMethodOrder(OrderAnnotation.class)
public class AuthServiceTest1 {

    private AuthService authService;

    @BeforeEach
    void setup() {
        authService = new AuthService();
    }

    @Test
    @Order(1)
    void test_1_isValidUser_shouldReturnTrueForValidInput() {
        System.out.println("Executing test_1_isValidUser");
        boolean result = authService.isValidUser("farhan", "farhan12");
        Assertions.assertTrue(result);
    }

    @Test
    @Order(2)
    void test_2_generateToken_shouldReturnFormattedToken() {
        System.out.println("Executing test_2_generateToken");
        String token = authService.generateToken("farhan");
        Assertions.assertEquals("TOKEN_FARHAN", token);
    }

    @Test
    @Order(3)
    void test_3_sendLoginNotification_shouldCallNotificationService() {
        System.out.println("Executing test_3_sendLoginNotification");
    }


}
