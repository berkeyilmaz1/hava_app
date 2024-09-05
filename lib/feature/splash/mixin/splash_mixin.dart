import 'package:flutter/material.dart';
import 'package:hava_app/feature/home/view/home_view.dart';
import 'package:hava_app/feature/splash/cubit/weather_cubit.dart';
import 'package:hava_app/feature/splash/view/splash_view.dart';
import 'package:hava_app/product/base/base_state.dart';
import 'package:hava_app/product/init/service/weather_service.dart';

mixin SplashViewMixin on State<SplashView>, BaseState<SplashView> {
  late final WeatherCubit weatherCubit;
  final ValueNotifier<bool> loading = ValueNotifier(true);

  @override
  void initState() {
    super.initState();
    setupCubit();
    getCurrentWeather();
  }

  void setupCubit() {
    weatherCubit = WeatherCubit(
      weatherService: WeatherService(networkManager: networkManager),
    );
  }

  Future<void> getCurrentWeather() async {
    final city = await weatherCubit.getCurrentCity();
    final currentWeather = await weatherCubit.fetchCurrentWeather(city);
    if (currentWeather == null) {
      loading.value = false;
      showError();
      return;
    }

    navigateHomeView();
  }

  void navigateHomeView() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomeView(weatherCubit: weatherCubit),
      ),
    );
  }

  void showError() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Error fetching weather data'),
      ),
    );
    getCurrentWeather();
  }
}
