import static java.lang.Class.forName;
import java.sql.*;

public class Main {
    public static void main(String[] args) {
        String Username = "lab03";
        String Password = "lab03";
        String URL = "jdbc:oracle:thin:@localhost:1521:xe";

        String Query = "UPDATE department SET budget = budget * 0.9 WHERE budget > 99999";


        try{
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection connection = DriverManager.getConnection(URL, Username, Password);
            Statement stmt = connection.createStatement();
            stmt.executeUpdate(Query);
            System.out.println("Query Executed Successfully");
            connection.close();
        }
        catch (SQLException e) {
            System.out.println("Connection Failed : " + e.getMessage());
        }
        catch (ClassNotFoundException e) {
            System.out.println("Driver Not Found : " + e.getMessage());
        }
    }
}