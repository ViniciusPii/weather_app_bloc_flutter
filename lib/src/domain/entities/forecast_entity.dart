class ForecastEntity {
  ForecastEntity({
    required this.max,
    required this.min,
    required this.date,
    required this.weekday,
    required this.condition,
    required this.rainProbability,
  });

  final int max;
  final int min;
  final String date;
  final String weekday;
  final String condition;
  final int rainProbability;
}
