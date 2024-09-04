import 'package:geolocator/geolocator.dart';
import 'package:hava_app/core/service/model/base_error_model.dart';
import 'package:hava_app/product/init/service/model/weather_model.dart';
import 'package:hava_app/product/init/service/model/weather_service_paths.dart';
import 'package:vexana/vexana.dart';

/// Weather service interface
abstract class WeatherServiceInterface {
  ///Weather Service Interface
  WeatherServiceInterface({
    required INetworkManager<BaseErrorModel> networkManager,
  }) : _networkManager = networkManager;

  final INetworkManager<BaseErrorModel> _networkManager;

  /// this method gets weather information.

  Future<WeatherModel?> getCurrentWeather(Position city);
}

/// Weather service
final class WeatherService extends WeatherServiceInterface {
  WeatherService({required super.networkManager});

  @override
  Future<WeatherModel?> getCurrentWeather(Position city) async {
    final response = await _networkManager.send<WeatherModel, WeatherModel>(
      WeatherServicePaths.getCurrentWeather,
      parseModel: WeatherModel(),
      method: RequestType.GET,
      queryParameters: {
        'lat': city.latitude,
        'lon': city.longitude,
        'appid': 'APIKEY',
      },
    );
    return response.data;
  }
}
