part of '../home_view.dart';

/// WindInfoCard is a widget that displays the wind information of the weather.
final class WindInfoCard extends StatelessWidget {
  const WindInfoCard({super.key, this.currentWeather});
  final WeatherModel? currentWeather;
  @override
  Widget build(BuildContext context) {
    if (currentWeather == null || currentWeather?.main == null) {
      return Center(
        child: LottieBuilder.asset(LottieConstants.loading),
      );
    }
    return InfoGradientContainer(
      child: Column(
        children: [
          Padding(
            padding: const PagePadding.allVeryLow(),
            child: Text(
              LocaleKeys.app_wind.tr(),
              style: TextStyles.textStyleM,
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InformationCard(
                currentWeather: currentWeather,
                description: LocaleKeys.wind_degrees.tr(),
                info: currentWeather?.wind?.deg.toString() ?? '',
              ),
              InformationCard(
                currentWeather: currentWeather,
                description: LocaleKeys.wind_speed.tr(),
                info: currentWeather?.wind?.speed.toString() ?? '',
              ),
              InformationCard(
                currentWeather: currentWeather,
                description: LocaleKeys.wind_Gust.tr(),
                info: currentWeather?.wind?.gust.toString() ?? '',
              ),
            ],
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
