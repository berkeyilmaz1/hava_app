import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hava_app/feature/splash/cubit/weather_state.dart';
import 'package:hava_app/product/init/service/model/weather_model.dart';
import 'package:hava_app/product/init/service/weather_service.dart';

abstract class WeatherCubitInterface {
  Future<Position?> getCurrentCity();
  Future<void> fetchCurrentWeather(Position city);
}

final class WeatherCubit extends Cubit<WeatherState>
    implements WeatherCubitInterface {
  WeatherCubit({required WeatherServiceInterface weatherService})
      : _weatherService = weatherService,
        super(const WeatherState());

  final WeatherServiceInterface _weatherService;
  void _changeLoading(bool value) {
    emit(state.copyWith(isLoading: value));
  }

  @override
  Future<WeatherModel?> fetchCurrentWeather(Position city) async {
    _changeLoading(true);
    final currentWeather = await _weatherService.getCurrentWeather(city);
    _changeLoading(false);
    emit(state.copyWith(currentWeather: currentWeather));
    return currentWeather;
  }

  @override
  Future<Position> getCurrentCity() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    //TODO SHOW LOCATION SERVICES
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
}
