package Adapter;
import org.json.JSONObject;

import API.WeatherStackAPI;
import Weather.WeatherProvider;

public class WeatherStackAdapter implements WeatherProvider {
    private WeatherStackAPI weatherStackAPI;

    public WeatherStackAdapter(WeatherStackAPI weatherStackAPI) {
        this.weatherStackAPI = weatherStackAPI;
    }

    @Override
    public Weather getWeather(String location) {
        try{
            String response = WeatherStackAPI.getWeatherData(location);

            JSONObject jsonResponse = new JSONObject (response);
            JSONObject current =


        } catch (Exception e){
            System.out.println("Error fetching weather data from WeatherStack: " + e.getMessage());
            return null;
        }
    }
}
