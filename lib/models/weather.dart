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
    var temperature = double.parse(json['current']['temp']);
    var temperatureString = ((temperature - 32) * (5 / 9)).toStringAsFixed(1);
    final weather = json['current']['weather']['main'];
    final weatherIcon = json['current']['weather']['icon'];
    return Weather(
      temperature: temperatureString,
      weather: weather,
      watherIcon: weatherIcon,
    );
  }
}
