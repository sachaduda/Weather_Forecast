import 'package:flutter/cupertino.dart';
import 'package:weather_forecast/aplication/ui/screen_factory/screen_factory.dart';

//Удобная навигация.
abstract class Screens {
  static const main = '/';
  static const weatherInfo = '/weather_info';
  static const weatherDaysInfo = '/weather_info/weather_days_info';
}

class MainNavigation {
  String initialRoute(bool checkCity) =>
      checkCity ? Screens.weatherInfo : Screens.main;

  Map<String, WidgetBuilder> get routes => <String, WidgetBuilder>{
        Screens.main: (context) => ScreenFactory.instance.makeMainScreen(),
        Screens.weatherInfo: (context) =>
            ScreenFactory.instance.makeInfoScreen(),
        Screens.weatherDaysInfo: (context) =>
            ScreenFactory.instance.makeDaysInfoScreen(),
      };
}
