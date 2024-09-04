import 'package:geolocator/geolocator.dart';
import 'package:hava_app/core/service/model/base_error_model.dart';
import 'package:hava_app/product/init/service/model/weather_model.dart';
import 'package:hava_app/product/init/service/model/weather_service_paths.dart';
import 'package:hava_app/product/init/service/model/weather_service_query.dart';
import 'package:vexana/vexana.dart';

/// Weather service interface
abstract class IWeatherServiceInterface {
  ///Weather Service Interface
  IWeatherServiceInterface({
    required INetworkManager<BaseErrorModel> networkManager,
  }) : _networkManager = networkManager;

  final INetworkManager<BaseErrorModel> _networkManager;

  /// this method gets weather information.

  Future<WeatherModel?> getCurrentWeather(Position city);

  /// This method gets city location
  Future<Position?> getCurrentCity();
}

/// Weather service
final class WeatherService extends IWeatherServiceInterface {
  /// Weather Service constructor method required network manager
  WeatherService({required super.networkManager});

  @override
  Future<Position> getCurrentCity() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) return Future.error('Location services are disabled.');

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.',
      );
    }

    return Geolocator.getCurrentPosition();
  }

  @override
  Future<WeatherModel?> getCurrentWeather(Position city) async {
    final response = await _networkManager.send<WeatherModel, WeatherModel>(
      WeatherServicePaths.getCurrentWeather,
      parseModel: WeatherModel(),
      method: RequestType.GET,
      queryParameters: Map.fromEntries([
        WeatherQueries.makeQuery(
          query: WeatherQueries.lat,
          value: city.latitude,
        ),
        WeatherQueries.makeQuery(
          query: WeatherQueries.lon,
          value: city.longitude,
        ),
      ]),
    );
    return response.data;
  }
}
