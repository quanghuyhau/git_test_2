import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_flutter/dio_retrofit/weather/models/weather_model.dart';
import 'package:learn_flutter/dio_retrofit/weather/service/weather_service.dart';
import 'package:learn_flutter/dio_retrofit/weather/cubit/weather_cubit.dart';
import 'package:learn_flutter/dio_retrofit/weather/cubit/weather_state.dart';
import 'package:dio/dio.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherCubit(WeatherService(Dio()))..fetchWeathers(),
      child: Scaffold(
        body: BlocBuilder<WeatherCubit, WeatherState>(
          builder: (context, state) {
            if (state is WeatherLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is WeatherLoaded) {
              return _buildWeatherPageView(context, state.weathers);
            } else if (state is WeatherError) {
              return Center(child: Text('Error: ${state.message}'));
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }

  Widget _buildWeatherPageView(BuildContext context, List<WeatherModel> weathers) {
    final PageController pageController = PageController();

    return Stack(
      children: [
        PageView.builder(
          controller: pageController,
          scrollDirection: Axis.horizontal,
          itemCount: weathers.length,
          itemBuilder: (context, index) {
            final weather = weathers[index];
            return _buildWeather(context, weather);
          },
        ),
        Positioned(
          left: -10,
          top: MediaQuery.of(context).size.height / 2 + 25,
          child: IconButton(
            icon: const Icon(Icons.arrow_back, size: 40),
            onPressed: () {
              if (pageController.hasClients) {
                pageController.previousPage(
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeInOut,
                );
              }
            },
          ),
        ),
        Positioned(
          right: -10,
          top: MediaQuery.of(context).size.height / 2 +25 ,
          child: IconButton(
            icon: const Icon(Icons.arrow_forward, size: 40),
            onPressed: () {
              if (pageController.hasClients) {
                pageController.nextPage(
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeInOut,
                );
              }
            },
          ),
        ),
      ],
    );
  }

  Widget _buildWeather(BuildContext context, WeatherModel weather) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _cityName(weather),
          _currentTemperature(weather),
          if (weather.weather != null && weather.weather!.isNotEmpty)
            _present(weather),
          const SizedBox(height: 30),
          Container(
            height: 250,
            width: 300,
            decoration: BoxDecoration(
              color: Colors.deepPurple,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _windAndRain(weather),
                  const Divider(),
                  _temperatureWeather(weather),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _cityName(weather) {
    return Text(
      weather.name ?? '',
      style: const TextStyle(
        fontSize: 35,
        color: Colors.deepPurple,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _currentTemperature(weather) {
    return Text(
      "${weather.main?.temp?.toStringAsFixed(1) ?? ''}°C",
      style: const TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _present(weather) {
    return Text(
      weather.weather![0].main ?? '',
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _windAndRain(weather) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.wind_power,
              color: Colors.white,
            ),
            const SizedBox(height: 5),
            _itemWeather(
                title: "Tốc độ gió",
                value: "${weather.wind?.speed ?? ''} km/h"),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.water_drop,
              color: Colors.white,
            ),
            const SizedBox(height: 5),
            _itemWeather(
                title: "Lượng mưa", value: "${weather.main?.humidity ?? ''}%"),
          ],
        ),
      ],
    );
  }

  Widget _temperatureWeather(weather) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.sunny,
              color: Colors.white,
            ),
            const SizedBox(height: 5),
            _itemWeather(
                title: "Nhiệt độ cao nhất",
                value: "${weather.main?.tempMax?.toStringAsFixed(2) ?? ''}°C"),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.ac_unit,
              color: Colors.white,
            ),
            const SizedBox(height: 5),
            _itemWeather(
                title: "Nhiệt độ thấp nhất",
                value: "${weather.main?.tempMin?.toStringAsFixed(2) ?? ''}°C"),
          ],
        ),
      ],
    );
  }

  Widget _itemWeather({required String title, required String value}) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
