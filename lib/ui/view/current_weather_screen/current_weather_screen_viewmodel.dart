import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:weather_app/app/locator_service.dart';
import 'package:weather_app/model/weather.dart';
import 'package:weather_app/utilities/themes.dart';

class CurrentWeatherScreenViewModel extends BaseViewModel {
  WeatherResponse? weather;
  ThemeData theme = Themes.getTheme(Themes.darkThemeCode);

  Future<WeatherResponse> fetchWeatherWithLocation() async {
    //TODO: Handle nullable locationData
    locationService.determineCurrentUserPosition();
    var long = locationService.locationData!.longitude;
    var lat = locationService.locationData!.latitude;

    weather = await weatherApiService.getWeatherDataFromLocation(
        longitude: long, latitude: lat);
    return weather!;
  }

  Future<WeatherResponse> fetchWeatherWithCity({city}) async {
    weather = await weatherApiService.getWeatherData('lagos');
    return weather!;
  }
}
