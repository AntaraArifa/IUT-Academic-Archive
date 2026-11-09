package Weather;

public interface WeatherProvider {

    Weather getWeather(String location);
}