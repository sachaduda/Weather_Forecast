import 'package:bloc/bloc.dart';

import 'package:weather_forecast/aplication/domain/api/weather_api.dart';
import 'package:weather_forecast/aplication/domain/data_providers/weather_sharred_preferences.dart';
import 'package:weather_forecast/aplication/domain/models/weather_forecast_for_hours.dart';

part 'weather_hours_cubit.dart';
part 'weather_hours_state.dart';

// Удобное разделение Cubit.