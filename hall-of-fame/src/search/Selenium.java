package search;

import org.openqa.selenium.By;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;

public class Selenium {
    
    //WebDriver
    private WebDriver driver;
    
    //Properties
    public static final String WEB_DRIVER_ID = "webdriver.chrome.driver";
    public static final String WEB_DRIVER_PATH = "/Users/mina/git/hall-of-fame/hall-of-fame/ChromeDriver/chromedriver";
    
    //크롤링 할 URL
    private String base_url;
    
    public Selenium() {
        super();
 
        //System Property SetUp
        System.setProperty(WEB_DRIVER_ID, WEB_DRIVER_PATH);
        
        //Driver SetUp
        driver = new ChromeDriver();
        base_url = "https://search.naver.com/search.naver?sm=tab_hty.top&where=blog&query=%EC%84%9C%EC%9A%B8+%EB%AA%85%EC%A7%80%EB%8C%80&oquery=%EC%84%9C%EC%9A%B8+%EB%AA%85%EC%A7%80%EB%8C%80+%EB%A7%9B%EC%A7%91&tqi=U80TrwprvTVssExWTXKssssssNh-195875";
    }
 
    public void crawl(String store) {
 
        try {
            //get page (= 브라우저에서 url을 주소창에 넣은 후 request 한 것과 같다)
            driver.get(base_url);
            System.out.println(driver.getPageSource());
            
            
            driver.findElement(By.id("nx_query")).sendKeys(" "+store); //검색창에 값 입력 - 대신 아예 그 창에서 입력받는게 중요
            //로그인 버튼 클릭
            driver.findElement(By.id("nx_query")).sendKeys(Keys.ENTER); // 검색창 엔터치기
            driver.findElement(By.id("sp_blog_1")).click(); //맨위에 뜨는 블로그 클릭
            
            
            Thread.sleep(20000);
            
    
        } catch (Exception e) {
            
            e.printStackTrace();
        
        } finally {
 
        	  //이거 지우면 창 안꺼지는듯;
        }
 
    }
 
}
