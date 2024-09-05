import 'package:intl/intl.dart';
/// Formatters is a class that contains methods to format data.
final class Formatters {
  Formatters._();

  static String convertUnixToDate(int unixTime) {
    final date = DateTime.fromMillisecondsSinceEpoch(
      unixTime * 1000,
    );

    return DateFormat(_timeFormatCode).format(date);
  }

  static const _timeFormatCode = 'HH:mm:ss';
}
