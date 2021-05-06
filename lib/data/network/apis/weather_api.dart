import 'package:geolocator/geolocator.dart';
import 'package:weather_app_bloc/data/network/rest_client.dart';
import 'package:weather_app_bloc/models/weather.dart';
import './weather_api_key.dart';

class WeatherApi {
  WeatherApi(this._restClient);

  RestClient _restClient;

  Future<Weather> getWeather(Position position) async {
    try {
      final response = await _restClient.get(
          'https://api.openweathermap.org/data/2.5/onecall?lat=${position.latitude}&lon=${position.longitude}&exclude=hourly,daily,minutely&appid=$key');
      final weather = Weather.fromJSON(response);
      return weather;
    } catch (e) {
      throw e;
    }
  }
}
