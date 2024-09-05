import 'package:flutter/material.dart';
/// Locales is an enum class that contains the supported locales.
enum Locales {
  en(Locale('en')),
  tr(Locale('tr'));

  final Locale locale;
  const Locales(this.locale);
}
