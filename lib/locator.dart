import 'package:get_it/get_it.dart';
import 'package:weather_app_bloc/data/network/apis/weather_api.dart';
import 'package:weather_app_bloc/data/network/rest_client.dart';

final locator = GetIt.instance;

void setup() {
  locator.registerLazySingleton(() => WeatherApi(RestClient()));
}
