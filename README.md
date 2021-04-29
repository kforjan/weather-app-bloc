# CurrentWeather - Flutter application for checking current local weather

Flutter application for checking the weather at your current location.

## About

This application uses business logic component (BLoC) as a method of state management. BLoC makes it easy to separate business logic from the UI. That helps with performance, maintainability, makes testing easier and makes the code reusable. Weather BLoC in the application manages the location loading and weather loading states of the main screen. Http package is used for requests to the REST API and geolocator packaege is used for locating the device.

## Used packages

* [bloc](https://pub.dev/packages/bloc)
* [flutter_bloc](https://pub.dev/packages/flutter_bloc)
* [geolocator](https://pub.dev/packages/geolocator)
* [get_it](https://pub.dev/packages/get_it)
* [http](https://pub.dev/packages/http)

## Features

* Finding current location of the device
* Getting and displaying information about current weather from OpenWeatherMap API


## Setup

  1. Clone the repository using the link below:
  ```
  https://github.com/kforjan/weather-app-bloc.git
  ```

  2. Get an API key from [here](https://openweathermap.org/api) and replace the **{key}** in the *lib/data/network/apis/weather_api.dart* with your key.

  3. Go to the project root and execute the following commands:
  ```
  flutter pub get
  flutter run
  ```

## Preview

![Weather application preview](https://s3.gifyu.com/images/weather-app-preview.gif)
