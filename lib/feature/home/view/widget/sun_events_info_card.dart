part of '../home_view.dart';

/// SunEventsInfoCard is a widget that displays the sunrise and
///  sunset information of the weather.
final class SunEventsInfoCard extends StatelessWidget {
  const SunEventsInfoCard({super.key, this.currentWeather});
  final WeatherModel? currentWeather;

  @override
  Widget build(BuildContext context) {
    if (currentWeather == null || currentWeather!.main == null) {
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
              LocaleKeys.app_sunEvents.tr(),
              style: TextStyles.textStyleM,
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InformationCard(
                currentWeather: currentWeather,
                description: LocaleKeys.sunEvents_sunrise.tr(),
                info: Formatters.convertUnixToDate(
                  currentWeather?.sys?.sunrise ?? 0,
                ),
              ),
              InformationCard(
                currentWeather: currentWeather,
                description: LocaleKeys.sunEvents_sunset.tr(),
                info: Formatters.convertUnixToDate(
                  currentWeather?.sys?.sunset ?? 0,
                ),
              ),
            ],
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
