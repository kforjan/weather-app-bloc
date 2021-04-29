import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';
import 'package:weather_app_bloc/data/network/apis/weather_api.dart';
import 'package:weather_app_bloc/models/weather.dart';

import '../../locator.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial());

  @override
  Stream<WeatherState> mapEventToState(
    WeatherEvent event,
  ) async* {
    Position position;
    if (event is GetWeather) {
      yield LocationLoading();
      if (await Geolocator.isLocationServiceEnabled() == false) {
        Geolocator.requestPermission();
      }
      try {
        position = await Geolocator.getCurrentPosition();
        yield WeatherLoading();
      } catch (e) {
        yield LocationError('Location error');
      }
      try {
        final weather = await locator<WeatherApi>().getWeather(position);
        yield WeatherLoaded(weather);
      } catch (e) {
        yield WeatherError('Weather error');
      }
    }
  }
}
