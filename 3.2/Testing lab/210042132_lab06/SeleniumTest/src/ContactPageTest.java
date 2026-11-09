import org.junit.jupiter.api.Test;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.Select;
import org.openqa.selenium.support.ui.WebDriverWait;

import java.time.Duration;

import static org.junit.jupiter.api.Assertions.assertTrue;

public class ContactPageTest extends BaseTest{
    @Test
    public void testSendButton(){
            driver.get("https://practicesoftwaretesting.com/contact");
            WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(5));
            driver.findElement(By.id("first_name")).sendKeys("John");
            driver.findElement(By.id("last_name")).sendKeys("Doe");
            driver.findElement(By.id("email")).sendKeys("john.doe@example.com");
            Select subjectDropdown = new Select(driver.findElement(By.id("subject")));
            subjectDropdown.selectByValue("customer-service");
            driver.findElement(By.id("message")).sendKeys("asdfghjkldsfghjkllfdxcghjkl;sfdgjlkdxgfcjhjlkzsfdxgchjbknldxgfchbjknl.");
            WebElement sendButton = driver.findElement(By.className("btnSubmit"));
            sendButton.click();
            WebElement successMessage = wait.until(ExpectedConditions.visibilityOfElementLocated(
                    By.xpath("/html/body/app-root/div/app-contact/div/div/div/div")));
            assertTrue(successMessage.isDisplayed(), "Success message is not displayed");
    }
}
