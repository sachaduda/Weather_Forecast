import 'package:flutter/material.dart';
import 'package:weather_forecast/aplication/domain/data_providers/weather_sharred_preferences.dart';

import 'aplication/ui/my_app/my_app.dart';

void main() async {
  //Инициализация привязки до runApp().
  WidgetsFlutterBinding.ensureInitialized();
  //Проверка, есть ли уже сохраненное название города в SharredPreferences
  bool isCity = await WeatherDataProvider.checkCity();
  final app = MyApp(
    isCity: isCity,
  );
  runApp(app);
}
