part of 'cubit.dart';

// State со всеми нужными методами
class WeatherHoursState {
  final String? cityName;
  final WeatherForecastHours? weatherForecastHours;

  WeatherHoursState({
    this.cityName,
    this.weatherForecastHours,
  });

  factory WeatherHoursState.initial() =>
      WeatherHoursState(cityName: null, weatherForecastHours: null);

  WeatherHoursState copyWith({
    String? cityName,
    WeatherForecastHours? weatherForecastHours,
  }) {
    return WeatherHoursState(
      cityName: cityName ?? this.cityName,
      weatherForecastHours: weatherForecastHours ?? this.weatherForecastHours,
    );
  }

  @override
  String toString() =>
      'WeatherState(cityName: $cityName, weatherForecast: $weatherForecastHours)';

  @override
  bool operator ==(covariant WeatherHoursState other) {
    if (identical(this, other)) return true;

    return other.cityName == cityName &&
        other.weatherForecastHours == weatherForecastHours;
  }

  @override
  int get hashCode => cityName.hashCode ^ weatherForecastHours.hashCode;
}
