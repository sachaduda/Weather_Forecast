//Модель, в которую парсятся данные для 3-х временных промежутков для конкретного города.

class WeatherForecastHours {
  final List<Day> days;

  WeatherForecastHours({
    required this.days,
  });

  factory WeatherForecastHours.fromJson(Map<String, dynamic> json) {
    return WeatherForecastHours(
      days: (json['list'] as List<dynamic>)
          .map((dynamic e) => Day.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'list': days,
    };
  }
}

class Day {
  final int? date;
  final WeatherParameters? weatherParameters;
  final Wind? wind;
  Day({
    required this.date,
    required this.weatherParameters,
    required this.wind,
  });

  factory Day.fromJson(Map<String, dynamic> json) {
    return Day(
      date: json['dt'],
      weatherParameters: WeatherParameters.fromJson(json['main']),
      wind: Wind.fromJson(json['wind']),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'dt': date,
      'main': weatherParameters,
      'wind': wind,
    };
  }
}

class WeatherParameters {
  double? temperature;
  int? humidity;

  WeatherParameters({
    this.temperature,
    this.humidity,
  });

  factory WeatherParameters.fromJson(Map<String, dynamic> json) {
    return WeatherParameters(
      // Пришлось делать такие преобразования, так как Api посылает то int, то double - решил сделать так.
      temperature: double.parse(json['temp'].toString()),
      humidity: json['humidity'],
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
  final double? speed;

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
