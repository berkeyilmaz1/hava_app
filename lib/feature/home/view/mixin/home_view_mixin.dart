import 'package:flutter/material.dart';
import 'package:hava_app/feature/home/view/home_view.dart';
import 'package:hava_app/product/utils/constants/lottie_constants.dart';
import 'package:lottie/lottie.dart';

mixin HomeViewMixin on State<HomeView> {
  LottieBuilder createWeatherAnimation(int id) {
    if (200 <= id && id < 300) {
      return LottieBuilder.asset(LottieConstants.thunderDay);
    } else if (300 <= id && id < 400) {
      return LottieBuilder.asset(LottieConstants.drizzleDay);
    } else if (500 <= id && id < 505) {
      return LottieBuilder.asset(LottieConstants.rainWithSunDay);
    } else if (511 <= id && id < 532) {
      return LottieBuilder.asset(LottieConstants.rainDay);
    } else if (600 <= id && id < 700) {
      return LottieBuilder.asset(LottieConstants.snowDay);
    } else if (700 <= id && id < 800) {
      return LottieBuilder.asset(LottieConstants.atmosphereDay);
    } else if (id == 800) {
      return LottieBuilder.asset(LottieConstants.clearDay);
    } else if (id == 801 || id == 802) {
      return LottieBuilder.asset(LottieConstants.cloudSunLow);
    }
    return LottieBuilder.asset(LottieConstants.cloudSunHigh);
  }
}
