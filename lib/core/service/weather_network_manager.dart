// ignore_for_file: public_member_api_docs

import 'dart:io';

import 'package:hava_app/core/service/model/base_error_model.dart';
import 'package:vexana/vexana.dart';

final class WeatherNetworkManager extends NetworkManager<BaseErrorModel> {
  WeatherNetworkManager()
      : super(
          isEnableLogger: true,
          options: BaseOptions(
            baseUrl: _baseUrl,
            contentType: _contentType,
            validateStatus: (status) {
              return (status ?? 0) < HttpStatus.permanentRedirect;
            },
          ),
        );

  static const String _baseUrl = 'https://api.openweathermap.org/data/2.5/';

  static const String _contentType = 'application/json';
}
