import 'package:intl/intl.dart';

//Метод для форматирования даты из запроса.

class Util {
  static String getFormattedDate(DateTime dateTime) {
    return DateFormat('yyyy-MM-dd – kk:mm').format(dateTime);
  }
}
