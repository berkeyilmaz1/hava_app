import 'package:flutter/material.dart';
import 'package:hava_app/core/service/weather_network_manager.dart';
/// BaseState is a mixin class that provides [networkManager] instance for the
mixin BaseState<T extends StatefulWidget> on State<T> {
  /// Network manager instance
  final networkManager = WeatherNetworkManager();
}
