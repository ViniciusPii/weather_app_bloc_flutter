import 'dart:convert';

import 'package:weather_app_bloc_flutter/src/models/forecast_model.dart';

class WeatherModel {
  WeatherModel({
    required this.temp,
    required this.cid,
    required this.date,
    required this.time,
    required this.city,
    required this.humidity,
    required this.imgId,
    required this.sunset,
    required this.sunrise,
    required this.cityName,
    required this.forecast,
    required this.currently,
    required this.windSpeedy,
    required this.description,
    required this.conditionSlug,
    required this.contitionCode,
  });

  final int temp;
  final String cid;
  final String date;
  final String time;
  final String city;
  final int humidity;
  final String imgId;
  final String sunset;
  final String sunrise;
  final String cityName;
  final String currently;
  final String windSpeedy;
  final String description;
  final String conditionSlug;
  final String contitionCode;
  final List<ForecastModel> forecast;

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'temp': temp});
    result.addAll({'cid': cid});
    result.addAll({'date': date});
    result.addAll({'time': time});
    result.addAll({'city': city});
    result.addAll({'humidity': humidity});
    result.addAll({'imgId': imgId});
    result.addAll({'sunset': sunset});
    result.addAll({'sunrise': sunrise});
    result.addAll({'cityName': cityName});
    result.addAll({'currently': currently});
    result.addAll({'windSpeedy': windSpeedy});
    result.addAll({'description': description});
    result.addAll({'conditionSlug': conditionSlug});
    result.addAll({'contitionCode': contitionCode});
    result.addAll({'forecast': forecast.map((x) => x.toMap()).toList()});

    return result;
  }

  factory WeatherModel.fromMap(Map<String, dynamic> map) {
    return WeatherModel(
      temp: map['temp']?.toInt() ?? 0,
      cid: map['cid'] ?? '',
      date: map['date'] ?? '',
      time: map['time'] ?? '',
      city: map['city'] ?? '',
      humidity: map['humidity']?.toInt() ?? 0,
      imgId: map['imgId'] ?? '',
      sunset: map['sunset'] ?? '',
      sunrise: map['sunrise'] ?? '',
      cityName: map['cityName'] ?? '',
      currently: map['currently'] ?? '',
      windSpeedy: map['wind_speedy'] ?? '',
      description: map['description'] ?? '',
      conditionSlug: map['condition_slug'] ?? '',
      contitionCode: map['contitionCode'] ?? '',
      forecast: List<ForecastModel>.from(map['forecast']?.map((x) => ForecastModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory WeatherModel.fromJson(String source) => WeatherModel.fromMap(json.decode(source));
}
