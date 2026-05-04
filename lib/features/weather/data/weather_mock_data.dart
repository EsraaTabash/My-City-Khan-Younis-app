import 'weather_model.dart';

class WeatherMockData {
  static const WeatherModel currentWeather = WeatherModel(
    city: 'مدينة خانيونس',
    dayName: 'السبت',
    date: '25 - 2 - 2019',
    temperature: '25°C',
    rainPercentage: '40%',
    windPercentage: '40%',
    sunriseTime: '15 : 15',
    sunsetTime: '27 : 41',
    weatherIconPath: 'assets/images/weather.svg',
    cardBackgroundPath: 'assets/images/weather-bg2.png',
  );
}
