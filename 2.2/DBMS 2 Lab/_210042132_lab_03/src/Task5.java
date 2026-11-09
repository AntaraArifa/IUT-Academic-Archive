import java.sql.*;

public class Task5 {
    public static void main(String[] args) {
        String Username = "lab03";
        String Password = "lab03";
        String URL = "jdbc:oracle:thin:@localhost:1521:xe";

        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection connection = DriverManager.getConnection(URL, Username, Password);
            Statement stmt = connection.createStatement();

            // Step 1: Retrieve students without an advisor
            String getStudentsWithoutAdvisor = "SELECT s.ID, s.name, s.dept_name " +
                    "FROM student s " +
                    "WHERE NOT EXISTS (SELECT 1 FROM advisor a WHERE a.s_ID = s.ID)";

            ResultSet studentsWithoutAdvisorResult = stmt.executeQuery(getStudentsWithoutAdvisor);

            // Step 2-4: Assign an advisor from the department with the least number of students advised
            while (studentsWithoutAdvisorResult.next()) {
                String studentID = studentsWithoutAdvisorResult.getString("ID");
                String studentName = studentsWithoutAdvisorResult.getString("name");
                String department = studentsWithoutAdvisorResult.getString("dept_name");

                // Find an advisor from the department with the least number of students advised
                String getLeastBusyAdvisor = "SELECT a.i_ID, i.name, COUNT(a.s_ID) as num_students_advised " +
                        "FROM advisor a " +
                        "JOIN instructor i ON a.i_ID = i.ID " +
                        "WHERE i.dept_name = '" + department + "' " +
                        "GROUP BY a.i_ID, i.name " +
                        "ORDER BY num_students_advised ASC";

                ResultSet leastBusyAdvisorResult = stmt.executeQuery(getLeastBusyAdvisor);

                if (leastBusyAdvisorResult.next()) {
                    String advisorID = leastBusyAdvisorResult.getString("i_ID");
                    String advisorName = leastBusyAdvisorResult.getString("name");
                    int numStudentsAdvised = leastBusyAdvisorResult.getInt("num_students_advised");

                    // Step 3: Assign the advisor to the student
                    String assignAdvisorQuery = "INSERT INTO advisor VALUES ('" + studentID + "', '" + advisorID + "')";

                    // Execute the query to assign the advisor
                    int rowsAffected = stmt.executeUpdate(assignAdvisorQuery);

                    // Step 4: Print the results
                    if (rowsAffected > 0) {
                        System.out.println("Assigned advisor for student " + studentName +
                                " (ID: " + studentID + ") from department " + department +
                                ". Advisor: " + advisorName + " (ID: " + advisorID +
                                "). Number of students advised by advisor: " + numStudentsAdvised);
                    } else {
                        System.out.println("Failed to assign advisor for student " + studentName +
                                " (ID: " + studentID + ")");
                    }

                }
            }

            connection.close();
        } catch (ClassNotFoundException e) {
            System.out.println("Driver Not Found: " + e.getMessage());
        } catch (SQLException e) {
            System.out.println("Connection Failed: " + e.getMessage());
        }
    }
}