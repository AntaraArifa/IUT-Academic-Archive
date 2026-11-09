import org.junit.jupiter.api.Test;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import java.time.Duration;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

public class ProductDetailsTest extends BaseTest{
    @Test
    public void testIncreaseAmount(){
        driver.get("https://practicesoftwaretesting.com/product/01K0GDDXQR02F6YEFZCMMTKA7T");
        WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(5));
        WebElement quantityInput = wait.until(driver -> driver.findElement(By.id("quantity-input")));
        int initialQuantity = Integer.parseInt(quantityInput.getAttribute("value"));
        WebElement plus= driver.findElement(By.id("btn-increase-quantity"));
        plus.click();
        wait.until(driver -> Integer.parseInt(driver.findElement(By.id("quantity-input")).getAttribute("value")) > initialQuantity);
        int updatedQuantity = Integer.parseInt(driver.findElement(By.id("quantity-input")).getAttribute("value"));
        assertEquals(initialQuantity + 1, updatedQuantity, "Quantity did not increase by 1");
    }
    @Test
    public void testFavToastAppears() {
        driver.get("https://practicesoftwaretesting.com/product/01K0GGVRHZND68EQGFQW48GF3D");
        WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(10));
        WebElement favButton = wait.until(ExpectedConditions.elementToBeClickable(By.id("btn-add-to-favorites")));
        favButton.click();
        WebElement toastContainer = wait.until(ExpectedConditions.visibilityOfElementLocated(By.id("toast-container")));
        boolean toastDisplayed = !toastContainer.findElements(By.xpath("./*")).isEmpty();
        assertTrue(toastDisplayed, "Toast message did not appear after adding to cart");
    }
    @Test
    public void testAddtoCart() {
        driver.get("https://practicesoftwaretesting.com/product/01K0GGVRHZND68EQGFQW48GF3D");
        WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(10));
        wait.until(ExpectedConditions.presenceOfElementLocated(By.cssSelector(".input-group.quantity")));
        WebElement addToCartButton = wait.until(ExpectedConditions.elementToBeClickable(By.id("btn-add-to-cart")));
        addToCartButton.click();
        WebElement toastContainer = wait.until(ExpectedConditions.visibilityOfElementLocated(By.id("toast-container")));
        boolean toastDisplayed = !toastContainer.findElements(By.xpath("./*")).isEmpty();
        assertTrue(toastDisplayed, "Toast message did not appear after adding to favorites");
    }
}
