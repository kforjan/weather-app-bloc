import 'package:flutter/material.dart';
import 'package:weather_app_bloc/locator.dart';
import 'package:weather_app_bloc/ui/home_screen.dart';

void main() {
  setup();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LocalWeather',
      home: HomeScreen(),
    );
  }
}
