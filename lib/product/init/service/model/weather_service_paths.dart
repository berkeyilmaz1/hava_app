import 'package:hava_app/product/init/service/model/weather_service_query.dart';

/// This class contains the paths of the weather service.
final class WeatherServicePaths {
  WeatherServicePaths._init();

  static final getCurrentWeather =
      'weather?lat=${WeatherQueries.lat.name}&lon=${WeatherQueries.lon.name}&appid=APIKEY';
}
