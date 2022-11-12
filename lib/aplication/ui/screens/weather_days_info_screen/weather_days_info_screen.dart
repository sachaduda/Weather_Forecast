import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecast/aplication/domain/blocs/weather_hours_cubit/cubit.dart';
import 'package:weather_forecast/aplication/domain/models/weather_forecast_for_hours.dart';
import 'package:weather_forecast/aplication/utilities/forecast_util.dart';

class WeatherDaysInfoWidget extends StatelessWidget {
  const WeatherDaysInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherHoursCubit, WeatherHoursState>(
        builder: (context, state) {
      final cityName = state.cityName;
      final weather = state.weatherForecastHours;
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
          title: Text(cityName),
        ),
        body: ListView.builder(
          itemCount: weather.days.length,
          itemBuilder: (BuildContext context, int index) {
            return _WeatherListItemWidget(
              index: index,
              weatherForecastDays: weather,
            );
          },
        ),
      );
    });
  }
}

class _WeatherListItemWidget extends StatelessWidget {
  final WeatherForecastHours weatherForecastDays;
  final int index;

  const _WeatherListItemWidget(
      {required this.weatherForecastDays, required this.index});

  @override
  Widget build(BuildContext context) {
    final date = DateTime.fromMillisecondsSinceEpoch(
        weatherForecastDays.days[index].date! * 1000);
    return Column(
      children: [
        const SizedBox(height: 10),
        Text(
          Util.getFormattedDate(date),
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.whatshot_sharp),
                title: const Text('Temperature: '),
                subtitle: Text(
                    '${weatherForecastDays.days[index].weatherParameters!.temperature} °C'),
              ),
              ListTile(
                leading: const Icon(Icons.assessment_sharp),
                title: const Text('Humidity: '),
                subtitle: Text(
                    '${weatherForecastDays.days[index].weatherParameters!.humidity} %'),
              ),
              ListTile(
                leading: const Icon(Icons.air),
                title: const Text('Wind speed: '),
                subtitle: Text(
                    '${weatherForecastDays.days[index].wind!.speed} meter/sec'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
