import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hava_app/feature/splash/view/splash_view.dart';
import 'package:hava_app/product/init/localization/main_localization.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    MainLocalization(
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'NunitoSans',
        cardTheme: const CardTheme(
          elevation: 8,
        ),
      ),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: const SplashView(),
    );
  }
}
