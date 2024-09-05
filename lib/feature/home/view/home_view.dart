import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hava_app/feature/home/view/mixin/home_view_mixin.dart';
import 'package:hava_app/feature/splash/cubit/weather_cubit.dart';
import 'package:hava_app/feature/splash/cubit/weather_state.dart';
import 'package:hava_app/product/base/base_state.dart';
import 'package:hava_app/product/init/localization/locale_keys.g.dart';
import 'package:hava_app/product/init/service/model/weather_model.dart';
import 'package:hava_app/product/utils/constants/lottie_constants.dart';
import 'package:hava_app/product/utils/constants/text_styles.dart';
import 'package:hava_app/product/utils/formatters.dart';
import 'package:hava_app/product/utils/page_padding.dart';
import 'package:hava_app/product/widgets/info_gradient_container.dart';
import 'package:hava_app/product/widgets/information_card.dart';
import 'package:lottie/lottie.dart';

part 'widget/main_info_card.dart';
part 'widget/sun_events_info_card.dart';
part 'widget/wind_info_card.dart';

/// HomeView is the main view of the application.
/// It displays the current weather information.
final class HomeView extends StatefulWidget {
  const HomeView({required this.weatherCubit, super.key});
  final WeatherCubit weatherCubit;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with BaseState, HomeViewMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => widget.weatherCubit,
      child: Scaffold(
        body: BlocBuilder<WeatherCubit, WeatherState>(
          builder: (context, state) {
            return Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.pink.shade100, Colors.blue.shade500],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          state.currentWeather?.name ?? '',
                          style: TextStyles.textStyleL,
                        ),
                        createWeatherAnimation(
                          state.currentWeather?.weather?.first.id ?? 0,
                        ),
                        Text(
                          LocaleKeys.app_celcius.tr(
                            args: [
                              state.currentWeather?.main?.temp.toString() ?? '',
                            ],
                          ),
                          style: TextStyles.textStyleL,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Positioned.fill(
                      child: PageView(
                        children: [
                          MainInfoCard(
                            currentWeather: state.currentWeather,
                          ),
                          WindInfoCard(
                            currentWeather: state.currentWeather,
                          ),
                          SunEventsInfoCard(
                            currentWeather: state.currentWeather,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
