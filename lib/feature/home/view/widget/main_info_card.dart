part of '../home_view.dart';

/// MainInfoCard is a widget that displays the main information of the weather.
final class MainInfoCard extends StatelessWidget {
  const MainInfoCard({required this.currentWeather, super.key});
  final WeatherModel? currentWeather;

  @override
  Widget build(BuildContext context) {
    if (currentWeather == null || currentWeather!.main == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return Padding(
      padding: const PagePadding.all(),
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InformationCard(
              currentWeather: currentWeather,
              description: LocaleKeys.information_feelsLike.tr(),
              info: LocaleKeys.app_celcius.tr(
                args: [
                  currentWeather!.main!.feelsLike.toString(),
                ],
              ),
            ),
            InformationCard(
              currentWeather: currentWeather,
              description: LocaleKeys.information_temp.tr(),
              info: LocaleKeys.app_celcius.tr(
                args: [
                  currentWeather!.main!.temp.toString(),
                ],
              ),
            ),
            InformationCard(
              currentWeather: currentWeather,
              description: LocaleKeys.information_humidity.tr(),
              info: LocaleKeys.app_percentage.tr(
                args: [
                  currentWeather!.main!.humidity.toString(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
