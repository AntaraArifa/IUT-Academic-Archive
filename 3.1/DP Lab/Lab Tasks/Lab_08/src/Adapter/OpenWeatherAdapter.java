package Adapter;

import API.OpenWeatherAPI;
import Weather.WeatherProvider;

public class OpenWeatherAdapter implements WeatherProvider {
    private OpenWeatherAPI openWeatherAPI;

    public OpenWeatherAdapter(OpenWeatherAPI openWeatherAPI) {
        this.openWeatherAPI = openWeatherAPI;
    }

    @Override
    public Weather getWeather(String location) {

    }
}
