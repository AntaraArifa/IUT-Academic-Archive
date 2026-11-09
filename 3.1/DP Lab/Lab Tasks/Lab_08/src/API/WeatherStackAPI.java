package API;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

public class WeatherStackAPI {
    private static final String API_KEY = "343539613d5f6dc6d60a87d72474fc66";
    private static final String BASE_URL = "http://api.weatherstack.com/current";

    public String getWeatherData(String location) throws Exception {
        String urlString = BASE_URL + "?access_key=" + API_KEY + "&query=" + location;
        URL url = new URL(urlString);
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
        connection.setRequestMethod("GET");

        int responseCode = connection.getResponseCode();
        if (responseCode == HttpURLConnection.HTTP_OK) {
            BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
            StringBuilder response = new StringBuilder();
            String inputLine;
            while ((inputLine = in.readLine()) != null) {
                response.append(inputLine);
            }
            in.close();
            return response.toString();
        } else {
            throw new Exception("Error fetching weather data: " + responseCode);
        }
    }
}
