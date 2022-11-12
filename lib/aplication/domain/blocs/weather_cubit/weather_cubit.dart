part of 'cubit.dart';

// Bloc cubit для первого и второго экрана.
class WeatherCubit extends Cubit<WeatherState> {
  final _weatherDataProvider = WeatherDataProvider();
  final _weatherApi = WeatherApi();

  // Первичное состояние - все поля null.
  WeatherCubit() : super(WeatherState.initial()) {
    _initialize();
  }

  /* 
  При инициализации, которая происходит один раз, идет получение названия города из хранилища.
  Если название города есть в хранилище, то будет выполнен запрос в сеть для получения данных.
  */
  Future<void> _initialize() async {
    final cityName = await _weatherDataProvider.cityName();
    if (cityName.isEmpty) return;
    _fetchWeatherForecastData(cityName);
  }

  // Метод для записи названия города в хранилище (взаимодействует с UI).
  Future<void> searchWeather(String cityName) async {
    await _weatherDataProvider.saveCityName(cityName);
    _fetchWeatherForecastData(cityName);
  }

  /* 
  Метод для получениях данных из сети (взаимодействует с API). 
  Если при запросе произойдет ошибка, то здесь она сразу обработается.
  При получении ошибки в state добавляется информация, которая будет доступна пользователю.
  */
  Future<void> _fetchWeatherForecastData(String cityName) async {
    try {
      final weather = await _weatherApi.fetchWeatherForecast(cityName);
      emit(
        state.copyWith(
          cityName: cityName,
          weatherForecast: weather,
          error: null,
        ),
      );
    } catch (error) {
      emit(state.copyWith(error: error.toString()));
      emit(state.clearState());
      await deleteCityName();
    }
  }

  // Метод для удаления названия города из хранилища (взаимодействует с UI).
  Future<void> deleteCityName() async {
    await _weatherDataProvider.deleteCityName();
    emit(state.clearState());
  }
}
