import 'dart:convert';

class ForecastModel {
  ForecastModel({
    required this.max,
    required this.min,
    required this.date,
    required this.weekday,
    required this.condition,
    required this.description,
  });

  final int max;
  final int min;
  final String date;
  final String weekday;
  final String condition;
  final String description;

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'max': max});
    result.addAll({'min': min});
    result.addAll({'date': date});
    result.addAll({'weekday': weekday});
    result.addAll({'condition': condition});
    result.addAll({'description': description});

    return result;
  }

  factory ForecastModel.fromMap(Map<String, dynamic> map) {
    return ForecastModel(
      max: map['max']?.toInt() ?? 0,
      min: map['min']?.toInt() ?? 0,
      date: map['date'] ?? '',
      weekday: map['weekday'] ?? '',
      condition: map['condition'] ?? '',
      description: map['description'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ForecastModel.fromJson(String source) => ForecastModel.fromMap(json.decode(source));
}
