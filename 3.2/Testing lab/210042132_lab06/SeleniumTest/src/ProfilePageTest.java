import org.junit.jupiter.api.Test;
import org.openqa.selenium.By;
import org.openqa.selenium.NoSuchElementException;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import java.time.Duration;

import static org.junit.jupiter.api.Assertions.*;

public class ProfilePageTest extends BaseTest{
    @Test
    public void testUpdateProfile() throws InterruptedException {
        WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(10));
        driver.get("https://practicesoftwaretesting.com/auth/login");
        driver.findElement(By.id("email")).sendKeys("customer@practicesoftwaretesting.com");
        driver.findElement(By.id("password")).sendKeys("welcome01");
        driver.findElement(By.className("btnSubmit")).click();
        wait.until(ExpectedConditions.urlContains("/account"));
        driver.get("https://practicesoftwaretesting.com/account/profile");
        WebElement firstName = driver.findElement(By.id("first_name"));
        firstName.clear();
        firstName.sendKeys("Labibah");
        WebElement lastName = driver.findElement(By.id("last_name"));
        lastName.clear();
        lastName.sendKeys("Hoque");
        WebElement phone = driver.findElement(By.id("phone"));
        phone.clear();
        phone.sendKeys("01234567890");
        WebElement street = driver.findElement(By.id("street"));
        street.clear();
        street.sendKeys("123 Main St");
        WebElement postalCode = driver.findElement(By.id("postal_code"));
        postalCode.clear();
        postalCode.sendKeys("4000");
        WebElement city = driver.findElement(By.id("city"));
        city.clear();
        city.sendKeys("Dhaka");
        WebElement state = driver.findElement(By.id("state"));
        state.clear();
        state.sendKeys("Dhaka Division");
        WebElement country = driver.findElement(By.id("country"));
        country.clear();
        country.sendKeys("Bangladesh");
        WebElement submitButton = driver.findElement(By.cssSelector("button[data-test='update-profile-submit']"));
        submitButton.click();

        WebElement alert = null;
        long endTime = System.currentTimeMillis() + 10000; // 10 seconds max

        while (System.currentTimeMillis() < endTime) {
            try {
                alert = driver.findElement(By.cssSelector("div.alert.alert-success[role='alert']"));
                if (alert.isDisplayed()) {
                    break;
                }
            } catch (NoSuchElementException e) {
                // ignore and retry
            }
            Thread.sleep(200);
        }

        assertNotNull(alert);
        assertTrue(alert.getText().contains("Your profile is successfully updated!"));
    }
    @Test
    public void testChangePassword() throws InterruptedException {
        WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(10));
        driver.get("https://practicesoftwaretesting.com/auth/login");
        driver.findElement(By.id("email")).sendKeys("customer@practicesoftwaretesting.com");
        driver.findElement(By.id("password")).sendKeys("welcome01");
        driver.findElement(By.className("btnSubmit")).click();
        wait.until(ExpectedConditions.urlContains("/account"));
        driver.get("https://practicesoftwaretesting.com/account/profile");
        WebElement currentPassword = driver.findElement(By.id("current-password"));
        currentPassword.clear();
        currentPassword.sendKeys("welcome01");
        WebElement newPassword = driver.findElement(By.id("new-password"));
        newPassword.clear();
        newPassword.sendKeys("Welcome02@");
        WebElement newPasswordConfirm = driver.findElement(By.id("new-password-confirm"));
        newPasswordConfirm.clear();
        newPasswordConfirm.sendKeys("Welcome02@");
        WebElement changePasswordButton = driver.findElement(By.cssSelector("button[data-test='change-password-submit']"));
        changePasswordButton.click();
        WebElement alert = null;
        long endTime = System.currentTimeMillis() + 10000;
        while (System.currentTimeMillis() < endTime) {
            try {
                alert = driver.findElement(By.cssSelector("div.alert.alert-success[role='alert']"));
                if (alert.isDisplayed()) {
                    break;
                }
            } catch (NoSuchElementException e) {
            }
            Thread.sleep(200);
        }

        assertNotNull(alert);
        assertTrue(alert.getText().contains("Your password is successfully updated!")
                || alert.getText().contains("successfully updated"));
    }

}
