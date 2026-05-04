class WeatherModel {
  final String city;
  final String dayName;
  final String date;
  final String temperature;
  final String rainPercentage;
  final String windPercentage;
  final String sunriseTime;
  final String sunsetTime;
  final String weatherIconPath;
  final String cardBackgroundPath;

  const WeatherModel({
    required this.city,
    required this.dayName,
    required this.date,
    required this.temperature,
    required this.rainPercentage,
    required this.windPercentage,
    required this.sunriseTime,
    required this.sunsetTime,
    required this.weatherIconPath,
    required this.cardBackgroundPath,
  });
}
