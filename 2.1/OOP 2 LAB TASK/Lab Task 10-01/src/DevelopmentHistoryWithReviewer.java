import java.lang.annotation.*;

@Retention(RetentionPolicy.RUNTIME)
@Target({ElementType.CONSTRUCTOR, ElementType.METHOD})
@Documented
public @interface DevelopmentHistoryWithReviewer {
    int version() default 1;
    String developer();
    String tester() default "";
    String[] reviewers() default {};
}
