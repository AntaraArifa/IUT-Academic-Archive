import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import static org.mockito.Mockito.times;
import static org.mockito.Mockito.verify;

@ExtendWith(MockitoExtension.class)
public class AuthServiceTest3 {

    @InjectMocks
    private AuthService authService;

    @Mock
    private NotificationService notificationService;

    @Test
    void test_sendLoginNotification_shouldCallNotificationService() {
        String username = "john";

        authService.sendLoginNotification(notificationService, username);

        String expectedMessage = "User john has logged in.";

        verify(notificationService, times(1)).sendEmail(username, expectedMessage);
    }
}
