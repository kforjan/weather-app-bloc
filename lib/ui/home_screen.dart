import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_bloc/blocs/weather_bloc/weather_bloc.dart';

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
      body: Center(
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
                    return Text(state.weather.temperature);
                  } else {
                    return Text('error');
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
    );
  }

  Widget _buildInitial() {
    return Text('Get the current weather on your location now!');
  }

  Widget _buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildWeatherDisplay() {
    return Container();
  }

  void _getWeather(BuildContext context) {
    final weatherBloc = BlocProvider.of<WeatherBloc>(context);
    weatherBloc.add(GetWeather());
  }
}
