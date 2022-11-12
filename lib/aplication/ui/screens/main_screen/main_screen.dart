import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecast/aplication/domain/blocs/weather_cubit/cubit.dart';
import 'package:weather_forecast/aplication/ui/navigation/main_navigation.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              _TitleWidget(),
              SizedBox(height: 20),
              _CityFormWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class _TitleWidget extends StatelessWidget {
  const _TitleWidget();

  @override
  Widget build(BuildContext context) {
    return const Text('Enter the name of the city');
  }
}

class _CityFormWidget extends StatefulWidget {
  const _CityFormWidget();

  @override
  State<_CityFormWidget> createState() => _CityFormWidgetState();
}

class _CityFormWidgetState extends State<_CityFormWidget> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WeatherCubit, WeatherState>(
      // Отслеживает состояние. И в зависимости от результата выводит либо ошибку, либо следующий экран.
      listener: (context, state) {
        if (state.error != null) {
          showOverlay(context, state.error!);
        }
        if (state.weatherForecast != null) {
          Navigator.of(context).pushNamed(Screens.weatherInfo);
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            TextFormField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'City',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.read<WeatherCubit>().searchWeather(_controller.text);
              },
              child: const Text('Get weather'),
            ),
          ],
        );
      },
    );
  }
}

//Метод возвращает AlertDialog.
void showOverlay(BuildContext context, String error) {
  showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(error),
        actions: <Widget>[
          TextButton(
            child: const Text('Okey'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
