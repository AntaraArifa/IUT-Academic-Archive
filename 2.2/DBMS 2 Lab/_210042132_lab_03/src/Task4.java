import java.sql.*;

public class Task4 {
    public static void main(String[] args) {
        String Username = "lab03";
        String Password = "lab03";
        String URL = "jdbc:oracle:thin:@localhost:1521:xe";

        String dept_name = "SELECT dept_name " +
                "FROM (" +
                "    SELECT dept_name, ROW_NUMBER() OVER (ORDER BY COUNT(*) ASC) as rnk " +
                "    FROM student " +
                "    GROUP BY dept_name " +
                ") " +
                "WHERE rnk = 1";

        String highest_ID = "SELECT MAX(ID) FROM student";

        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection connection = DriverManager.getConnection(URL, Username, Password);
            Statement stmt = connection.createStatement();

            ResultSet rs_1 = stmt.executeQuery(highest_ID);
            int h_id = 0;
            while (rs_1.next()) {
                h_id = rs_1.getInt(1);
            }
            h_id = h_id + 1;

            ResultSet rs_2 = stmt.executeQuery(dept_name);
            String low_dept = "";
            while (rs_2.next()) {
                low_dept = rs_2.getString(1);
            }

            String insert = "INSERT INTO student VALUES (" + h_id + ", 'John Doe', '" + low_dept + "', 3.6)";
            int r = stmt.executeUpdate(insert);
            if (r > 0) {
                System.out.println("Query Executed Successfully");
            } else {
                System.out.println("Query Failed");
            }
            connection.close();
        } catch (ClassNotFoundException e) {
            System.out.println("Driver Not Found: " + e.getMessage());
        } catch (SQLException e) {
            System.out.println("Connection Failed: " + e.getMessage());
        }
    }
}