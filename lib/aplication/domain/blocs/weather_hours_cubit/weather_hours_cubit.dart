part of 'cubit.dart';

class WeatherHoursCubit extends Cubit<WeatherHoursState> {
  final _weatherDataProvider = WeatherDataProvider();
  final _weatherApi = WeatherApi();

  WeatherHoursCubit() : super(WeatherHoursState.initial()) {
    _initialize();
  }

  /* 
  При инициализации, которая происходит один раз, идет получение названия города из хранилища.
  Если название города есть в хранилище, то будет выполнен запрос в сеть для получения данных.
  На данном этапе точно известно, что данные есть в хранилище.
  */
  Future<void> _initialize() async {
    final cityName = await _weatherDataProvider.cityName();

    final weather = await _weatherApi.fetchWeatherForecastDays(cityName);
    final sortingWeather = _sortWeather(weather);
    emit(state.copyWith(
        cityName: cityName, weatherForecastHours: sortingWeather));
  }

  // Сортировка по температуре
  WeatherForecastHours _sortWeather(WeatherForecastHours weather) {
    weather.days.sort(
      (a, b) => a.weatherParameters!.temperature!
          .compareTo(b.weatherParameters!.temperature!),
    );
    return weather;

    // Оставил сортировку пузырьком, хотел сначала сделать так, пока не подумал, что есть готовый вариант.
    // for (step = 0; step < n; step++) {
    //   for (i = 0; i < n - step - 1; i++) {
    //     if ((weather.days[i].weatherParameters!.temperature)! >
    //         (weather.days[i + 1].weatherParameters!.temperature)!) {
    //       var temp = weather.days[i];
    //       weather.days[i] = weather.days[i + 1];
    //       weather.days[i + 1] = temp;
    //     }
    //   }
    // }
  }
}
