import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:learn_flutter/dio_retrofit/atomi/weather/cubit/weather_state.dart';
import 'package:learn_flutter/dio_retrofit/atomi/weather/models/weather_model.dart';
import 'package:learn_flutter/dio_retrofit/atomi/weather/service/weather_service.dart';
import 'package:logger/logger.dart';

@injectable
class WeatherCubit extends Cubit<WeatherState> {
  final WeatherService _weatherService;
  final Logger _logger = Logger();

  WeatherCubit(this._weatherService) : super(WeatherInitial());

  Future<void> fetchWeathers() async {
    emit(WeatherLoading());
    List<String> city = ['HaNoi', 'London', 'Tokyo', 'DaNang', 'BuSan', 'Manchester'];
    String apiKey = '4d79064f926b9bf10a96162219198ca2';
    List<WeatherModel> weathers = [];

    for (String city in city) {
      try {
        WeatherModel weather = await _weatherService.getWeather(city, apiKey, 'metric');
        weathers.add(weather);
        _logger.i(jsonEncode(weather));
      } catch (e) {
        _logger.e('Error fetching weather for $city: $e');
      }
    }

    emit(WeatherLoaded(weathers));
  }
}
