import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:weather_app/services/app_services/connectivity_service.dart';
import 'package:weather_app/services/app_services/local_storage_services.dart';
import 'package:weather_app/services/app_services/location_service.dart';
import 'package:weather_app/services/core_services/weather_api_service.dart';
import 'package:weather_app/ui/view/current_weather_screen/curent_weather_screen_view.dart';
import 'package:weather_app/ui/view/home/home_view.dart';
import 'package:weather_app/ui/view/locations/locations_view.dart';
import 'package:weather_app/ui/view/weather_screen/weather_screen_view.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: WeatherScreenView, initial: true),
    MaterialRoute(page: LocationsView),
    MaterialRoute(page: HomeView),
    MaterialRoute(page: CurrentWeatherScreenView),
    
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: SnackbarService),
    Singleton(classType: WeatherApiService),
    Presolve(
      classType: SharedPreferenceLocalStorage,
      presolveUsing: SharedPreferences.getInstance,
    ),
    Presolve(
      classType: ConnectivityService,
      presolveUsing: ConnectivityService.getInstance,
    ),
    Presolve(
      classType: LocationService,
      presolveUsing: LocationService.getInstance,
    ),
  ],
  logger: StackedLogger(),
)
class AppSetup {
  /** This class has no puporse besides housing the annotation that generates the required functionality **/
}
