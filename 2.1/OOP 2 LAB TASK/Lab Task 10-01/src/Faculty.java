import java.util.List;
import java.util.ArrayList;

@DevelopmentHistory(developer = "YourName")
public class Faculty {
    private String name;
    private String designation;
    private double salary;
    private List<Course> courses;

    public Faculty(String name, String designation, double salary, List<Course> courses) {
        this.name = name;
        this.designation = designation;
        this.salary = salary;
        this.courses = courses;
    }

    public Faculty(String name, String designation, double salary) {
        this.name = name;
        this.designation = designation;
        this.salary = salary;
        this.courses = new ArrayList<>();
    }

    @DevelopmentHistoryWithReviewer(developer = "YourName")
    public void teach(Course course) {
        // Teaching logic
    }

    @DevelopmentHistoryWithReviewer(developer = "YourName", reviewers = {"Reviewer1", "Reviewer2"})
    public void research(String topic) {
        // Research logic
    }

    // Getters and setters for the attributes
}
