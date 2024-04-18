class ForecastEntity {
  ForecastEntity({
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
}
