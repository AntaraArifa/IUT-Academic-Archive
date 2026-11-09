import org.junit.jupiter.api.Test;
import org.openqa.selenium.By;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.Select;
import org.openqa.selenium.support.ui.WebDriverWait;
import org.openqa.selenium.interactions.Actions;
import java.time.Duration;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

public class HomePageTest extends BaseTest{
    @Test
    public void testSortOptions() {
        WebElement sortDropdown = driver.findElement(By.className("form-select"));
        Select select = new Select(sortDropdown);
        select.selectByVisibleText("Price (High - Low)");
        assertEquals("Price (High - Low)", select.getFirstSelectedOption().getText());
    }
    @Test
    public void testFilterByCategory() {
        WebElement categoryCheckbox = driver.findElement(By.xpath("/html/body/app-root/div/app-overview/div[3]/div[1]/fieldset[1]/div[1]/label/input"));
        categoryCheckbox.click();
        assertTrue(categoryCheckbox.isSelected());
    }
    @Test
    public void testFilterByBrand() {
        WebElement brandCheckbox = driver.findElement(By.xpath("/html/body/app-root/div/app-overview/div[3]/div[1]/fieldset[2]/div[1]/label/input"));
        brandCheckbox.click();
        assertTrue(brandCheckbox.isSelected());
    }
    @Test
    public void testSearchBarFunctionality() {
        driver.get("https://practicesoftwaretesting.com");

        WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(5));

        WebElement searchInput = wait.until(ExpectedConditions.presenceOfElementLocated(By.id("search-query")));
        searchInput.sendKeys("Drill");
        searchInput.sendKeys(Keys.ENTER);

        wait.until(ExpectedConditions.presenceOfAllElementsLocatedBy(By.cssSelector("h5[data-test='product-name']")));

        List<WebElement> results = driver.findElements(By.cssSelector("h5[data-test='product-name']"));
        assertFalse(results.isEmpty(), "No results found.");

        for (WebElement result : results) {
            System.out.println(result.getText()); // Optional: for debugging
            assertTrue(result.getText().toLowerCase().contains("drill"));
        }
    }
    @Test
    public void testPriceRangeSlider() throws InterruptedException {
        driver.get("https://practicesoftwaretesting.com");

        WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(10));

        WebElement sliderMin = wait.until(ExpectedConditions.presenceOfElementLocated(
                By.cssSelector(".ngx-slider-pointer-min")));
        WebElement sliderMax = driver.findElement(By.cssSelector(".ngx-slider-pointer-max"));

        Actions actions = new Actions(driver);
        actions.clickAndHold(sliderMin).moveByOffset(150, 0).release().perform();
        actions.clickAndHold(sliderMax).moveByOffset(-150, 0).release().perform();

        // Wait for prices to update
        Thread.sleep(2000);
        List<WebElement> prices = driver.findElements(By.cssSelector("span[data-test='product-price']"));
        for (WebElement price : prices) {
            String text = price.getText().replaceAll("[^\\d.]", "");
            double val = Double.parseDouble(text);
            assertTrue(val >= 50 && val <= 150,
                    "Price " + val + " not within range 50-150");
        }
    }


}
