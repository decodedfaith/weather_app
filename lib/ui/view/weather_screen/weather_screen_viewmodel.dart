import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:weather_app/app/app.router.dart';
import 'package:weather_app/app/locator_service.dart';
import 'package:weather_app/model/weather.dart';
import 'package:weather_app/ui/view/widgets/city_list_dialog.dart';
import 'package:weather_app/utilities/cities.dart';
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

  void showCityChangeDialog(context) {
    CityListDialog(
      cities: Cities.cities,
      onSelectedCitiesChanged: (returnedList) {
        cities = returnedList;
        notifyListeners();
      },
    );
  }

  onOptionMenuItemSelected(OptionsMenu item, context) {
    switch (item) {
      case OptionsMenu.changeCity:
        showCityChangeDialog(context);
        break;
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
    for (var city in cities) {
      var rr = await weatherApiService.getWeatherData(city);
      citiesWeatherResponse.add(rr);
    }
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