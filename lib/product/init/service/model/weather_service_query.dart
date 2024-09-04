/// This class is used to make queries for the weather service.
enum WeatherQueries {
  lat,
  lon;

  static MapEntry<String, String> makeQuery({
    required WeatherQueries query,
    required double value,
  }) {
    return MapEntry(query.name, value.toString());
  }
}
