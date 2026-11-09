import org.junit.jupiter.api.Test;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import java.time.Duration;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

public class FavoritePageTest extends BaseTest{
    @Test
    public void testFavProducts() {
        WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(10));
        driver.get("https://practicesoftwaretesting.com/auth/login");
        driver.findElement(By.id("email")).sendKeys("customer@practicesoftwaretesting.com");
        driver.findElement(By.id("password")).sendKeys("welcome01");
        driver.findElement(By.className("btnSubmit")).click();
        wait.until(ExpectedConditions.urlContains("/account"));
        driver.get("https://practicesoftwaretesting.com/account/favorites");
        wait.until(ExpectedConditions.presenceOfElementLocated(
                By.cssSelector("div[data-test^='favorite-']")
        ));
        List<WebElement> favoriteProducts = driver.findElements(
                By.cssSelector("div[data-test^='favorite-']")
        );
        assertFalse(favoriteProducts.isEmpty(), "No favorite products are displayed.");
    }
    @Test
    public void testDeleteButton(){
        WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(10));
        driver.get("https://practicesoftwaretesting.com/auth/login");
        driver.findElement(By.id("email")).sendKeys("customer@practicesoftwaretesting.com");
        driver.findElement(By.id("password")).sendKeys("welcome01");
        driver.findElement(By.className("btnSubmit")).click();
        wait.until(ExpectedConditions.urlContains("/account"));
        driver.get("https://practicesoftwaretesting.com/account/favorites");
        wait.until(ExpectedConditions.presenceOfElementLocated(
                By.cssSelector("div[data-test^='favorite-']")
        ));
        List<WebElement> favoriteProductsBefore = driver.findElements(
                By.cssSelector("div[data-test^='favorite-']")
        );
        int initialCount = favoriteProductsBefore.size();
        assertTrue(initialCount > 0, "No favorites to delete");
        WebElement firstDeleteButton = favoriteProductsBefore.get(0)
                .findElement(By.cssSelector("button[data-test='delete']"));
        firstDeleteButton.click();
        wait.until(ExpectedConditions.numberOfElementsToBeLessThan(
                By.cssSelector("div[data-test^='favorite-']"), initialCount
        ));
        List<WebElement> favoriteProductsAfter = driver.findElements(
                By.cssSelector("div[data-test^='favorite-']")
        );
        assertEquals(initialCount - 1, favoriteProductsAfter.size(), "Product was not removed");
    }
}
