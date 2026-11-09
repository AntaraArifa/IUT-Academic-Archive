package Weather;

public class Weather {
    private String location;
    private double temperature;
    private String condition;
    private String source;

    public Weather(String location, double temperature, String condition, String source) {
        this.location = location;
        this.temperature = temperature;
        this.condition = condition;
        this.source = source;
    }
}