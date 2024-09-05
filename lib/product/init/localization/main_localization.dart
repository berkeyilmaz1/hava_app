import 'package:easy_localization/easy_localization.dart';
import 'package:hava_app/product/init/localization/enum/locale_enums.dart';
import 'package:hava_app/product/utils/constants/locale_constants.dart';

final class MainLocalization extends EasyLocalization {
  MainLocalization({
    required super.child,
    super.key,
  }) : super(
          path: localizationPath,
          useOnlyLangCode: true,
          supportedLocales: LocaleConstants.supportedLocales,
          fallbackLocale: Locales.en.locale,
        );
  static const String localizationPath = 'assets/translations';
}
