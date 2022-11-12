import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecast/aplication/domain/blocs/weather_hours_cubit/cubit.dart';
import 'package:weather_forecast/aplication/ui/screens/main_screen/main_screen.dart';
import 'package:weather_forecast/aplication/ui/screens/weather_days_info_screen/weather_days_info_screen.dart';
import 'package:weather_forecast/aplication/ui/screens/weather_info_screen/weather_info_screen.dart';

// Класс для создания экранов.
class ScreenFactory {
  ScreenFactory._();

  // Исключает пересоздание.
  static final instance = ScreenFactory._();

  Widget makeMainScreen() => const MainScreen();
  Widget makeInfoScreen() => const WeatherInfoWidget();
  // Внедрение Cubit в 3 экран.
  Widget makeDaysInfoScreen() => BlocProvider<WeatherHoursCubit>(
        create: (_) => WeatherHoursCubit(),
        child: const WeatherDaysInfoWidget(),
      );
}
