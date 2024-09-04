import 'package:flutter/material.dart';
import 'package:hava_app/feature/splash/mixin/splash_mixin.dart';
import 'package:hava_app/product/base/base_state.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with BaseState, SplashViewMixin {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          color: Colors.blue,
        ),
      ),
    );
  }
}
