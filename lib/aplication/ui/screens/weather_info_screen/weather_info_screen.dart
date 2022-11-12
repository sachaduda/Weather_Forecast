import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecast/aplication/domain/blocs/weather_cubit/cubit.dart';
import 'package:weather_forecast/aplication/ui/navigation/main_navigation.dart';

class WeatherInfoWidget extends StatelessWidget {
  const WeatherInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        final cityName = state.cityName;
        final weather = state.weatherForecast;
        //Проверка полей.
        if (cityName == null || weather == null) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text(cityName),
            actions: [
              ElevatedButton(
                onPressed: () =>
                    Navigator.of(context).pushNamed(Screens.weatherDaysInfo),
                child: const Text('3 hours weather'),
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<WeatherCubit>().deleteCityName();
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil(Screens.main, (route) => false);
                },
                child: const Icon(Icons.location_city),
              )
            ],
          ),
          body: Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  leading: const Icon(Icons.whatshot_sharp),
                  title: const Text('Temperature: '),
                  subtitle: Text('${weather.weatherParameters.temperature} °C'),
                ),
                ListTile(
                  leading: const Icon(Icons.assessment_sharp),
                  title: const Text('Humidity: '),
                  subtitle: Text('${weather.weatherParameters.humidity} %'),
                ),
                ListTile(
                  leading: const Icon(Icons.air),
                  title: const Text('Wind speed: '),
                  subtitle: Text('${weather.wind.speed} meter/sec'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
