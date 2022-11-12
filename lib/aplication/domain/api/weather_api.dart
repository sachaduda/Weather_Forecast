import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_forecast/aplication/domain/models/weather_forecast.dart';
import 'package:weather_forecast/aplication/domain/models/weather_forecast_for_hours.dart';
import 'package:weather_forecast/aplication/utilities/constans.dart';

// Класс для запросов в сеть.
class WeatherApi {
  // Запрос в сеть для конкретного времени.
  Future<WeatherForecast> fetchWeatherForecast(String cityName) async {
    var queryParameters = {
      'q': cityName,
      'appid': Constants.weatherAppId,
      'units': 'metric',
    };

    var url = Uri.http(Constants.weatherBaseUrlDomain,
        Constants.weatherForecastPath, queryParameters);

    var response = await http.get(url);

    if (response.statusCode == 200) {
      return WeatherForecast.fromJson(json.decode(response.body));
    } else {
      throw Exception('Data acquisition error!');
    }
  }

  // Запрос в сеть для 3-х временных промежутков.
  Future<WeatherForecastHours> fetchWeatherForecastDays(String cityName) async {
    var queryParameters = {
      'q': cityName,
      'appid': Constants.weatherAppId,
      'cnt': '3',
      'units': 'metric',
    };

    var url = Uri.http(Constants.weatherBaseUrlDomain,
        Constants.weatherForecastPathDays, queryParameters);

    var response = await http.get(url);

    if (response.statusCode == 200) {
      return WeatherForecastHours.fromJson(json.decode(response.body));
    } else {
      throw Exception('Data acquisition error!');
    }
  }
}
