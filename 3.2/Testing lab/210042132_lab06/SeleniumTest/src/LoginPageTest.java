import org.junit.jupiter.api.Test;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import java.time.Duration;

import static org.junit.jupiter.api.Assertions.assertTrue;

public class LoginPageTest extends BaseTest{
    @Test
    public void testLogin(){
        driver.get("https://practicesoftwaretesting.com/auth/login");
        WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(5));
        driver.findElement(By.id("email")).sendKeys("customer@practicesoftwaretesting.com");
        driver.findElement(By.id("password")).sendKeys("welcome01");
        WebElement loginButton = driver.findElement(By.className("btnSubmit"));
        loginButton.click();
        wait.until(ExpectedConditions.urlContains("/account"));

        assertTrue(driver.getCurrentUrl().contains("/account"), "Did not navigate to Favorites page");
    }
}
