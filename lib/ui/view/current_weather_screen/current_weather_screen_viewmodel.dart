import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:stacked/stacked.dart';
import 'package:weather_app/app/locator_service.dart';
import 'package:weather_app/model/weather.dart';
import 'package:weather_app/utilities/themes.dart';

class CurrentWeatherScreenViewModel extends BaseViewModel {
  WeatherResponse? weather;
  ThemeData theme = Themes.getTheme(Themes.DARK_THEME_CODE);

  Future<WeatherResponse> fetchWeatherWithLocation() async {
    // var permissionHandler = PermissionHandler();
    // var permissionResult = await permissionHandler
    //     .requestPermissions([PermissionGroup.locationWhenInUse]);

    // switch (permissionResult[PermissionGroup.locationWhenInUse]) {
    //   case PermissionStatus.denied:
    //   case PermissionStatus.unknown:
    //     print('location permission denied');
    //     showLocationDeniedDialog(permissionHandler);
    //     throw Error();
    // }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);
    // _weatherBloc.dispatch(FetchWeather(
    //     longitude: position.longitude, latitude: position.latitude));

    //TODO: Handle nullable locationData
    var long = locationService.locationData!.longitude;
    var lat = locationService.locationData!.latitude;

    weather = await weatherApiService.getWeatherDataFromLocation(
        longitude: long, latitude: lat);
    return WeatherResponse();
  }

  Future<WeatherResponse> fetchWeatherWithCity({city}) async {
    weather = await weatherApiService.getWeatherData('lagos');
    return weather!;
  }
}
