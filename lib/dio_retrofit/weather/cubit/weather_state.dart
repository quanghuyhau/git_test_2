import 'package:learn_flutter/dio_retrofit/weather/models/weather_model.dart';

abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final List<WeatherModel> weathers;

  WeatherLoaded(this.weathers);
}

class WeatherError extends WeatherState {
  final String message;

  WeatherError(this.message);
}
