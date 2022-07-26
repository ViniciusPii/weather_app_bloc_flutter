import 'package:flutter/material.dart';

class WeatherIconModel {
  WeatherIconModel._();

  static final weatherIcons = {
    'storm': 'assets/images/wi-storm-showers.svg',
    'snow': 'assets/images/wi-snowflake-cold.svg',
    'hail': 'assets/images/wi-hail.svg',
    'rain': 'assets/images/wi-rain.svg',
    'fog': 'assets/images/wi-fog.svg',
    'clear_day': 'assets/images/wi-day-sunny.svg',
    'clear_night': 'assets/images/wi-night-clear.svg',
    'cloud': 'assets/images/wi-cloud.svg',
    'cloudly_day': 'assets/images/wi-day-cloudy.svg',
    'cloudly_night': 'assets/images/wi-night-alt-cloudy.svg',
    'none_day': Icons.wb_sunny_rounded,
    'none_night': Icons.nightlight,
  };
}
