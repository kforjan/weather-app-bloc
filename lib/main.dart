import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_bloc/blocs/weather_bloc/weather_bloc.dart';
import 'package:weather_app_bloc/injection_container.dart' as di;
import 'package:weather_app_bloc/ui/home_screen.dart';

void main() {
  di.setup();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LocalWeather',
      home: BlocProvider(
        create: (context) => WeatherBloc(),
        child: HomeScreen(),
      ),
    );
  }
}
