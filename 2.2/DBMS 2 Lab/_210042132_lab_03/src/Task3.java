import java.sql.*;
import java.util.Scanner;

public class Task3 {
    public static void main(String[] args) {

        Scanner scanner = new Scanner(System.in);
        System.out.println("Enter the Number of the student: ");
        int n = scanner.nextInt();
        String Query = "SELECT ID, name, dept_name, num_courses_taken " +
                "FROM (SELECT s.ID, s.name, s.dept_name, COUNT(t.course_id) as num_courses_taken " +
                "FROM student s " +
                "LEFT JOIN takes t ON s.ID = t.ID " +
                "GROUP BY s.ID, s.name, s.dept_name " +
                "ORDER BY num_courses_taken DESC) " +
                "WHERE ROWNUM <= " + n + "";



        String Username = "lab03";
        String Password = "lab03";
        String URL = "jdbc:oracle:thin:@localhost:1521:xe";

        try{
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection connection = DriverManager.getConnection(URL, Username, Password);
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery(Query);

            while(rs.next()){
                System.out.println(rs.getString("ID") + " " + rs.getString("name") + " " + rs.getString("dept_name") + " " + rs.getString("num_courses_taken"));
            }
            connection.close();
        }
        catch(ClassNotFoundException e){
            System.out.println("Driver Not Found : " + e.getMessage());
        }
        catch(SQLException e){
            System.out.println("Connection Failed : " + e.getMessage());
        }
    }
}