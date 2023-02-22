import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:weather_app/app/app.router.dart';
import 'package:weather_app/app/locator_service.dart';
import 'package:weather_app/model/weather.dart';
import 'package:weather_app/utilities/constants.dart';
import 'package:weather_app/utilities/enums.dart';
import 'package:weather_app/utilities/themes.dart';

class WeatherScreenViewModel extends BaseViewModel {
  WeatherResponse? weather;
  ThemeData theme = Themes.getTheme(Themes.darkThemeCode);
  List<String> cities = ['lagos', 'Osun', 'Oyo'];
  List<WeatherResponse> citiesWeatherResponse = [];

  Future<void> initState() async {
    //Retrieve Cached List of strings
    List<String>? retrivedList =
        sharedPreferencesService.getStringList(storedCitiesListKey);

    retrivedList != null ? cities = retrivedList : null;
  }

  Future<void> showCitySelectorDialog() async {
    var result = await dialogService.showCustomDialog(
      variant: DialogType.citySelector,
      title: 'Select City',
    );

    if (result != null && result.confirmed) {
      cities = result.data;
      notifyListeners();
    }
  }

  onOptionMenuItemSelected(OptionsMenu item, context) {
    switch (item) {
      case OptionsMenu.changeCity:
        return showCitySelectorDialog();
      case OptionsMenu.settings:
        //TODO: Implement Settings
        break;
      case OptionsMenu.currentLocationWeather:
        navigationService.navigateTo(Routes.currentWeatherScreenView);
        break;
    }
  }

  Future<WeatherResponse> fetchWeatherWithCity({city}) async {
    weather = await weatherApiService.getWeatherData('lagos');
    return weather!;
  }

  Future<List<WeatherResponse>> fetchWeatherWithCities() async {
     List<WeatherResponse> response = [];

    for (var city in cities) {
      var data = await weatherApiService.getWeatherData(city);
      response.add(data);
    }
    citiesWeatherResponse = response;
    return citiesWeatherResponse;
  }

  void showLocationDeniedDialog(context) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            title: const Text('Location is disabled :(',
                style: TextStyle(color: Colors.black)),
            actions: <Widget>[
              TextButton(
                child: const Text(
                  'Enable!',
                  style: TextStyle(color: Colors.green, fontSize: 16),
                ),
                onPressed: () {
                  // permissionHandler.openAppSettings();
                  // Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }
}
