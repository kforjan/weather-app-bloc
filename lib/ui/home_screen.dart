import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_bloc/blocs/weather_bloc/weather_bloc.dart';
import 'package:weather_app_bloc/models/weather.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.cloud),
            SizedBox(
              width: 10,
            ),
            Text('CurrentWather'),
          ],
        ),
      ),
      body: Container(
        color: Color.fromRGBO(183, 223, 243, 1),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                child: BlocConsumer<WeatherBloc, WeatherState>(
                  listener: (context, state) {
                    if (state is WeatherError) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(state.message),
                        ),
                      );
                    }
                    if (state is LocationError) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(state.message),
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state is WeatherInitial) {
                      return _buildInitial();
                    } else if (state is LocationLoading ||
                        state is WeatherLoading) {
                      return _buildLoading();
                    } else if (state is WeatherLoaded) {
                      return _buildWeatherDisplay(state.weather);
                    } else {
                      return _buildInitial();
                    }
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  _getWeather(context);
                },
                child: Text("How's the weather?"),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInitial() {
    return Container(
      height: 300,
      child: Column(
        children: [
          Text(
            'Get the current weather',
            style: TextStyle(fontSize: 30),
          ),
          Text(
            'on your location now!',
            style: TextStyle(fontSize: 30),
          ),
        ],
      ),
    );
  }

  Widget _buildLoading() {
    return Container(
      height: 300,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget _buildWeatherDisplay(Weather weather) {
    return Container(
      height: 300,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            weather.temperature + ' °C',
            style: TextStyle(fontSize: 50),
          ),
          Container(
              child: Image.asset('assets/images/${weather.watherIcon}.png')),
          Text(
            weather.weather,
            style: TextStyle(fontSize: 30),
          ),
        ],
      ),
    );
  }

  void _getWeather(BuildContext context) {
    final weatherBloc = BlocProvider.of<WeatherBloc>(context);
    weatherBloc.add(GetWeather());
  }
}
