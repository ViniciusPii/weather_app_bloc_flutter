import 'package:weather_app_bloc_flutter/src/data/data_sources/weather/weather_data_source.dart';
import 'package:weather_app_bloc_flutter/src/data/repositories/weather/weather_repository.dart';
import 'package:weather_app_bloc_flutter/src/models/weather_model.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  WeatherRepositoryImpl({
    required WeatherDataSource dataSource,
  }) : _dataSource = dataSource;

  final WeatherDataSource _dataSource;

  @override
  Future<WeatherModel> getWeather(double lat, double long) async =>
      await _dataSource.getWeather(lat, long);
}
