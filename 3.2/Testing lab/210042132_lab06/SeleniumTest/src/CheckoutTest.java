import org.junit.jupiter.api.Test;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.Select;
import org.openqa.selenium.support.ui.WebDriverWait;

import java.time.Duration;

import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

public class CheckoutTest extends BaseTest{
    @Test
    public void testCheckoutBuyNowPayLater() {
        WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(20));
        driver.get("https://practicesoftwaretesting.com/checkout");
        driver.get("https://practicesoftwaretesting.com/auth/login");
        driver.get("https://practicesoftwaretesting.com");
        driver.get("https://practicesoftwaretesting.com/product/01K0GQQF51PH42Q7WC9982RPFK");
        wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector("h1.product-title")));
        wait.until(ExpectedConditions.presenceOfElementLocated(By.id("btn-add-to-cart")));
        WebElement addToCartButton = wait.until(ExpectedConditions.elementToBeClickable(By.id("btn-add-to-cart")));
        addToCartButton.click();
        driver.findElement(By.id("email")).sendKeys("customer@practicesoftwaretesting.com");
        driver.findElement(By.id("password")).sendKeys("welcome01");
        driver.findElement(By.className("btnSubmit")).click();

        driver.get("https://practicesoftwaretesting.com/checkout");
        WebElement proceedStep1 = wait.until(ExpectedConditions.elementToBeClickable(By.cssSelector("button[data-test='proceed-1']")));
        proceedStep1.click();
        WebElement proceedStep2 = wait.until(ExpectedConditions.elementToBeClickable(By.cssSelector("button[data-test='proceed-2']")));
        proceedStep2.click();
        WebElement proceedStep3 = wait.until(ExpectedConditions.elementToBeClickable(By.cssSelector("button[data-test='proceed-3']")));
        proceedStep3.click();
        WebElement paymentMethodSelect = wait.until(ExpectedConditions.elementToBeClickable(By.cssSelector("select[data-test='payment-method']")));
        Select paymentSelect = new Select(paymentMethodSelect);
        paymentSelect.selectByValue("buy-now-pay-later");
        WebElement installmentsSelectElement = driver.findElement(By.cssSelector("select[data-test='monthly_installments']"));
        Select installmentsSelect = new Select(installmentsSelectElement);
        installmentsSelect.selectByValue("3");
        WebElement confirmButton = driver.findElement(By.cssSelector("button[data-test='finish']"));
        confirmButton.click();
        WebElement successMsg = wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector("div.alert.alert-success div[data-test='payment-success-message']")));
        assertNotNull(successMsg);
        assertTrue(successMsg.getText().contains("Payment was successful"));
    }

}
