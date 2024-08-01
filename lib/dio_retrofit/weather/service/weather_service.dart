import 'package:learn_flutter/dio_retrofit/weather/models/weather_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'weather_service.g.dart';

@RestApi(baseUrl: 'https://api.openweathermap.org/data/2.5')
abstract class WeatherService {
  factory WeatherService(Dio dio) = _WeatherService;

  @GET('/weather')
  Future<WeatherModel> getWeather(
    @Query('q') String cityName,
    @Query('appid') String apiKey,
    @Query('units') String units,
  );

}
