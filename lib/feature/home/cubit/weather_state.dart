import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hava_app/product/init/service/model/weather_model.dart';

final class WeatherState extends Equatable {
  const WeatherState({
    this.isLoading = false,
    this.currentWeather,
  });

  final bool isLoading;
  final WeatherModel? currentWeather;

  @override
  List<Object?> get props => [isLoading, currentWeather];

  WeatherState copyWith({
    bool? isLoading,
    WeatherModel? currentWeather,
    Position? currentCity,
  }) {
    return WeatherState(
      isLoading: isLoading ?? this.isLoading,
      currentWeather: currentWeather ?? this.currentWeather,
    );
  }
}
