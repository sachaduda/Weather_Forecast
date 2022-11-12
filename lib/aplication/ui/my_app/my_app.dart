import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecast/aplication/domain/blocs/weather_cubit/cubit.dart';
import 'package:weather_forecast/aplication/ui/navigation/main_navigation.dart';
import 'package:weather_forecast/aplication/ui/themes/app_theme.dart';

class MyApp extends StatelessWidget {
  // Переменная для проверки наличия названия города.
  final bool isCity;
  final mainNavigation = MainNavigation();
  MyApp({super.key, required this.isCity});

  @override
  Widget build(BuildContext context) {
    // Внедрение основного Cubit в 2 страницы.
    return BlocProvider<WeatherCubit>(
      create: (context) => WeatherCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: AppTheme.light,
        routes: mainNavigation.routes,
        initialRoute: mainNavigation.initialRoute(isCity),
      ),
    );
  }
}
