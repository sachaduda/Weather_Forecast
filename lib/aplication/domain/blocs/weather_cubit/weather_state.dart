part of 'cubit.dart';

// State со всеми нужными методами
class WeatherState {
  final String? cityName;
  final WeatherForecast? weatherForecast;
  final String? error;
  WeatherState({
    this.cityName,
    this.weatherForecast,
    this.error,
  });

  factory WeatherState.initial() =>
      WeatherState(cityName: null, weatherForecast: null, error: null);

  WeatherState copyWith({
    String? cityName,
    WeatherForecast? weatherForecast,
    String? error,
  }) {
    return WeatherState(
      cityName: cityName ?? this.cityName,
      weatherForecast: weatherForecast ?? this.weatherForecast,
      error: error ?? this.error,
    );
  }

  WeatherState clearState() {
    return WeatherState(
      cityName: null,
      weatherForecast: null,
      error: null,
    );
  }

  @override
  String toString() =>
      'WeatherState(cityName: $cityName, weatherForecast: $weatherForecast, error: $error)';

  @override
  bool operator ==(covariant WeatherState other) {
    if (identical(this, other)) return true;

    return other.cityName == cityName &&
        other.weatherForecast == weatherForecast &&
        other.error == error;
  }

  @override
  int get hashCode =>
      cityName.hashCode ^ weatherForecast.hashCode ^ error.hashCode;
}
