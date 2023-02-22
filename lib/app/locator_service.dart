import 'package:stacked_services/stacked_services.dart';
import 'package:weather_app/app/app.locator.dart';
import 'package:weather_app/services/app_services/connectivity_service.dart';
import 'package:weather_app/services/app_services/local_storage_services.dart';
import 'package:weather_app/services/app_services/location_service.dart';
import 'package:weather_app/services/core_services/weather_api_service.dart';

///* THIS IS A FILE WHERE ALL LOCATOR SERVICES ARE WRITTEN
///* THIS FILE IS USED TO INJECT SERVICES INTO THE APP

final weatherApiService = locator<WeatherApiService>();
final bottomSheetService = locator<BottomSheetService>();
final connectivityService = locator<ConnectivityService>();
final dialogService = locator<DialogService>();
final navigationService = locator<NavigationService>();
final sharedPreferencesService = locator<SharedPreferenceLocalStorage>();
final snackbarService = locator<SnackbarService>();
final locationService = locator<LocationService>();
