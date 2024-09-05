import 'package:flutter/material.dart';
import 'package:hava_app/product/init/localization/enum/locale_enums.dart';

///Application Localization Constants
@immutable
final class LocaleConstants {
  const LocaleConstants._();

  static List<Locale> supportedLocales =
      Locales.values.map((e) => e.locale).toList();
}
