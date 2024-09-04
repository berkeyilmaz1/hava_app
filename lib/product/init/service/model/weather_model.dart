// ignore_for_file: public_member_api_docs

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'weather_model.g.dart';

@JsonSerializable()
final class WeatherModel extends INetworkModel<WeatherModel>
    with EquatableMixin {
  WeatherModel({
    this.coord,
    this.weather,
    this.main,
    this.wind,
    this.clouds,
    this.dt,
    this.sys,
    this.timezone,
    this.id,
    this.name,
    this.cod,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherModelFromJson(json);
  final Coord? coord;
  final List<Weather>? weather;
  final Main? main;
  final Wind? wind;
  final Clouds? clouds;
  final int? dt;
  final Sys? sys;
  final int? timezone;
  final int? id;
  final String? name;
  final int? cod;

  @override
  WeatherModel fromJson(Map<String, dynamic> json) =>
      WeatherModel.fromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$WeatherModelToJson(this);

  @override
  List<Object?> get props =>
      [coord, weather, main, wind, clouds, dt, sys, timezone, id, name, cod];

  WeatherModel copyWith({
    Coord? coord,
    List<Weather>? weather,
    Main? main,
    Wind? wind,
    Clouds? clouds,
    int? dt,
    Sys? sys,
    int? timezone,
    int? id,
    String? name,
    int? cod,
  }) {
    return WeatherModel(
      coord: coord ?? this.coord,
      weather: weather ?? this.weather,
      main: main ?? this.main,
      wind: wind ?? this.wind,
      clouds: clouds ?? this.clouds,
      dt: dt ?? this.dt,
      sys: sys ?? this.sys,
      timezone: timezone ?? this.timezone,
      id: id ?? this.id,
      name: name ?? this.name,
      cod: cod ?? this.cod,
    );
  }
}

@JsonSerializable()
final class Coord extends INetworkModel<Coord> with EquatableMixin {
  Coord({
    this.lon,
    this.lat,
  });

  factory Coord.fromJson(Map<String, dynamic> json) => _$CoordFromJson(json);
  final double? lon;
  final double? lat;

  @override
  Coord fromJson(Map<String, dynamic> json) => Coord.fromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$CoordToJson(this);

  @override
  List<Object?> get props => [lon, lat];

  Coord copyWith({
    double? lon,
    double? lat,
  }) {
    return Coord(
      lon: lon ?? this.lon,
      lat: lat ?? this.lat,
    );
  }
}

@JsonSerializable()
final class Weather extends INetworkModel<Weather> with EquatableMixin {
  Weather({
    this.id,
    this.main,
    this.description,
    this.icon,
  });

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);
  final int? id;
  final String? main;
  final String? description;
  final String? icon;

  @override
  Weather fromJson(Map<String, dynamic> json) => Weather.fromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$WeatherToJson(this);

  @override
  List<Object?> get props => [id, main, description, icon];

  Weather copyWith({
    int? id,
    String? main,
    String? description,
    String? icon,
  }) {
    return Weather(
      id: id ?? this.id,
      main: main ?? this.main,
      description: description ?? this.description,
      icon: icon ?? this.icon,
    );
  }
}

@JsonSerializable()
final class Main extends INetworkModel<Main> with EquatableMixin {
  Main({
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
    this.pressure,
    this.humidity,
    this.seaLevel,
    this.grndLevel,
  });

  factory Main.fromJson(Map<String, dynamic> json) => _$MainFromJson(json);
  final double? temp;
  final double? feelsLike;
  final double? tempMin;
  final double? tempMax;
  final int? pressure;
  final int? humidity;
  final int? seaLevel;
  final int? grndLevel;

  @override
  Main fromJson(Map<String, dynamic> json) => Main.fromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$MainToJson(this);

  @override
  List<Object?> get props => [
        temp,
        feelsLike,
        tempMin,
        tempMax,
        pressure,
        humidity,
        seaLevel,
        grndLevel,
      ];

  Main copyWith({
    double? temp,
    double? feelsLike,
    double? tempMin,
    double? tempMax,
    int? pressure,
    int? humidity,
    int? seaLevel,
    int? grndLevel,
  }) {
    return Main(
      temp: temp ?? this.temp,
      feelsLike: feelsLike ?? this.feelsLike,
      tempMin: tempMin ?? this.tempMin,
      tempMax: tempMax ?? this.tempMax,
      pressure: pressure ?? this.pressure,
      humidity: humidity ?? this.humidity,
      seaLevel: seaLevel ?? this.seaLevel,
      grndLevel: grndLevel ?? this.grndLevel,
    );
  }
}

@JsonSerializable()
final class Wind extends INetworkModel<Wind> with EquatableMixin {
  Wind({
    this.speed,
    this.deg,
    this.gust,
  });

  factory Wind.fromJson(Map<String, dynamic> json) => _$WindFromJson(json);
  final double? speed;
  final int? deg;
  final double? gust;

  @override
  Wind fromJson(Map<String, dynamic> json) => Wind.fromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$WindToJson(this);

  @override
  List<Object?> get props => [speed, deg, gust];

  Wind copyWith({
    double? speed,
    int? deg,
    double? gust,
  }) {
    return Wind(
      speed: speed ?? this.speed,
      deg: deg ?? this.deg,
      gust: gust ?? this.gust,
    );
  }
}

@JsonSerializable()
final class Clouds extends INetworkModel<Clouds> with EquatableMixin {
  Clouds({
    this.all,
  });

  factory Clouds.fromJson(Map<String, dynamic> json) => _$CloudsFromJson(json);
  final int? all;

  @override
  Clouds fromJson(Map<String, dynamic> json) => Clouds.fromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$CloudsToJson(this);

  @override
  List<Object?> get props => [all];

  Clouds copyWith({
    int? all,
  }) {
    return Clouds(
      all: all ?? this.all,
    );
  }
}

@JsonSerializable()
final class Sys extends INetworkModel<Sys> with EquatableMixin {
  Sys({
    this.type,
    this.id,
    this.country,
    this.sunrise,
    this.sunset,
  });

  factory Sys.fromJson(Map<String, dynamic> json) => _$SysFromJson(json);
  final int? type;
  final int? id;
  final String? country;
  final int? sunrise;
  final int? sunset;

  @override
  Sys fromJson(Map<String, dynamic> json) => Sys.fromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$SysToJson(this);

  @override
  List<Object?> get props => [type, id, country, sunrise, sunset];

  Sys copyWith({
    int? type,
    int? id,
    String? country,
    int? sunrise,
    int? sunset,
  }) {
    return Sys(
      type: type ?? this.type,
      id: id ?? this.id,
      country: country ?? this.country,
      sunrise: sunrise ?? this.sunrise,
      sunset: sunset ?? this.sunset,
    );
  }
}
