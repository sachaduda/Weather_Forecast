import 'package:shared_preferences/shared_preferences.dart';

// Хранилище, в которое записывается название города.
class WeatherDataProvider {
  static const _cityNameKey = 'city_name';

  // Получить название города из хранилища.
  Future<String> cityName() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    var cityName = sharedPreferences.getString(_cityNameKey);
    if (cityName == null) return '';

    return cityName;
  }

  // Сохранить название города в хранилище.
  Future<void> saveCityName(String cityName) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(_cityNameKey, cityName);
  }

  // Удалить название города из хранилища.
  Future<void> deleteCityName() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove(_cityNameKey);
  }

  // Проверить, есть ли название города в хранилище.
  static Future<bool> checkCity() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    var cityName = sharedPreferences.getString(_cityNameKey);
    if (cityName == null) {
      return false;
    }
    return true;
  }
}
