//Модель, в которую парсятся данные в данный момент для конкретного города.

class WeatherForecast {
  final WeatherParameters weatherParameters;
  final Wind wind;

  WeatherForecast({required this.weatherParameters, required this.wind});

  factory WeatherForecast.fromJson(Map<String, dynamic> json) {
    return WeatherForecast(
      weatherParameters: WeatherParameters.fromJson(json['main']),
      wind: Wind.fromJson(json['wind']),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'main': weatherParameters.toJson(),
      'wind': wind.toJson(),
    };
  }
}

class WeatherParameters {
  final double temperature;
  final int humidity;

  WeatherParameters({required this.temperature, required this.humidity});

  factory WeatherParameters.fromJson(Map<String, dynamic> json) {
    return WeatherParameters(
      // Пришлось делать такие преобразования, так как Api посылает то int, то double - решил сделать так.
      temperature: double.parse(json['temp'].toString()),
      humidity: json['humidity'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'temp': temperature,
      'humidity': humidity,
    };
  }
}

class Wind {
  final double speed;

  Wind({required this.speed});

  factory Wind.fromJson(Map<String, dynamic> json) {
    // Пришлось делать такие преобразования, так как Api посылает то int, то double - решил сделать так.
    return Wind(speed: double.parse(json['speed'].toString()));
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'speed': speed,
    };
  }
}
