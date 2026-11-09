import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.*;

public class Task1 {
    public static void main(String[] args) {
        String Username = "lab03";
        String Password = "lab03";
        String URL = "jdbc:oracle:thin:@localhost:1521:xe";

        String query_1 = "SELECT COUNT(*) FROM department WHERE budget <= 99999";
        String query_2 = "UPDATE department SET budget = budget * 0.9 WHERE budget > 99999";

        int q1 = 0;

        try{
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection connection = DriverManager.getConnection(URL, Username, Password);
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery(query_1);
            while(rs.next()){
                q1 =  rs.getInt(1);
            }

            int r = stmt.executeUpdate(query_2);
            if(r > 0){
                System.out.println("Query Executed Successfully");
            }
            else {
                System.out.println("Query Failed");
            }
            connection.close();
        }
        catch(ClassNotFoundException e){
            System.out.println("Driver Not Found : " + e.getMessage());
        }
        catch(SQLException e){
            System.out.println("Connection Failed : " + e.getMessage());
        }

        System.out.println("Unaffected Departments: " + q1);
    }
}