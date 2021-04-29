import 'package:flutter/foundation.dart';

class Weather {
  Weather({
    @required this.temperature,
    @required this.weather,
    @required this.watherIcon,
  });

  String temperature;
  String weather;
  String watherIcon;

  factory Weather.fromJSON(Map<String, dynamic> json) {
    var temperature = json['current']['temp'];
    var temperatureString = (temperature - 272.15).toStringAsFixed(1);
    final weather = json['current']['weather'][0]['main'];
    final weatherIcon = json['current']['weather'][0]['icon'];
    return Weather(
      temperature: temperatureString,
      weather: weather,
      watherIcon: weatherIcon,
    );
  }
}
