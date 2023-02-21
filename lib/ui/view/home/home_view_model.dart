import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:weather_app/app/locator_service.dart';
import 'package:weather_app/utilities/constants.dart';
import 'package:weather_app/utilities/enums.dart';
import 'package:weather_app/utilities/themes.dart';

class HomeViewModel extends BaseViewModel {
  ThemeData _theme = Themes.getTheme(Themes.DARK_THEME_CODE);
  ThemeData get theme => _theme;

  int themeCode = Themes.DARK_THEME_CODE;
  TemperatureUnit temperatureUnit = TemperatureUnit.celsius;

  initState() {
    themeCode = sharedPreferencesService.getInt(sharedPrefKeyTheme) ??
        Themes.DARK_THEME_CODE;

    temperatureUnit = TemperatureUnit.values[
        sharedPreferencesService.getInt(sharedPrefKeyTemperatureUnit) ??
            TemperatureUnit.celsius.index];

    _theme = Themes.getTheme(themeCode);

    notifyListeners();
  }

  updateTheme(int themeCode) {
    _theme = Themes.getTheme(themeCode);
    this.themeCode = themeCode;
    sharedPreferencesService.setInt(sharedPrefKeyTheme, themeCode);

    notifyListeners();
  }

  updateTemperatureUnit(TemperatureUnit unit) {
    temperatureUnit = unit;
    sharedPreferencesService.setInt(sharedPrefKeyTemperatureUnit, unit.index);

    notifyListeners();
  }
}
