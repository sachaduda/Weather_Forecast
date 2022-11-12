import 'package:flutter/material.dart';

//Удобная настройка темы.

abstract class AppTheme {
  static final light = ThemeData(
    primarySwatch: Colors.blue,
  );
  static final dark = ThemeData.dark();
}
