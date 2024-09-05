import 'package:flutter/material.dart';
import 'package:hava_app/feature/splash/mixin/splash_mixin.dart';
import 'package:hava_app/product/base/base_state.dart';
import 'package:hava_app/product/utils/constants/lottie_constants.dart';
import 'package:lottie/lottie.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with BaseState, SplashViewMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ValueListenableBuilder<bool>(
          valueListenable: loading,
          builder: (_, loading, __) {
            return loading
                ? LottieBuilder.asset(LottieConstants.loading)
                : LottieBuilder.asset(LottieConstants.loadingError);
          },
        ),
      ),
    );
  }
}
