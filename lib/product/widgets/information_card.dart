import 'package:flutter/material.dart';
import 'package:hava_app/product/init/service/model/weather_model.dart';
import 'package:hava_app/product/utils/widget_sizes.dart';
/// InformationCard is a widget that displays the information of the weather.
final class InformationCard extends StatelessWidget {
  const InformationCard({
    required this.currentWeather,
    required this.description,
    required this.info,
    super.key,
  });

  final WeatherModel? currentWeather;
  final String description;
  final String info;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(info),
          const SizedBox(
            height: WidgetSizes.spacingS,
          ),
          Text(description),
        ],
      ),
    );
  }
}
