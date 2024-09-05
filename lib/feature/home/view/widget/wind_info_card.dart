part of '../home_view.dart';
/// WindInfoCard is a widget that displays the wind information of the weather.
final class WindInfoCard extends StatelessWidget {
  const WindInfoCard({super.key, this.currentWeather});
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
              description: LocaleKeys.wind_degrees.tr(),
              info: currentWeather!.wind!.deg.toString(),
            ),
            InformationCard(
              currentWeather: currentWeather,
              description: LocaleKeys.wind_speed.tr(),
              info: currentWeather!.wind!.speed.toString(),
            ),
            InformationCard(
              currentWeather: currentWeather,
              description: LocaleKeys.wind_Gust.tr(),
              info: currentWeather!.wind!.gust.toString(),
            ),
          ],
        ),
      ),
    );
  }
}
