part of 'weather_bloc.dart';

@immutable
abstract class WeatherState {
  const WeatherState();
}

class WeatherInitial extends WeatherState {
  const WeatherInitial();
}

class LocationLoading extends WeatherState {
  const LocationLoading();
}

class LocationError extends WeatherState {
  final String message;
  const LocationError(this.message);
}

class WeatherLoading extends WeatherState {
  final Position position;
  const WeatherLoading(this.position);
}

class WeatherLoaded extends WeatherState {}

class WeatherError extends WeatherState {
  final String message;
  const WeatherError(this.message);
}
