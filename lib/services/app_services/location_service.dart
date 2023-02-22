import 'package:geolocator/geolocator.dart';
import 'package:weather_app/app/app.logger.dart';

class LocationService {
  LocationService._() {
    log.i('LocationService 📍 initialized');
    _determineCurrentUserPosition();
  }
  static final LocationService instance = LocationService._();
  static Future<LocationService> getInstance() => Future.value(instance);

  final log = getLogger('LocationService📍');

  late Position? locationData;

  /// Determine the current position of the device.
  ///
  /// When the location services are not enabled or permissions
  /// are denied the `Future` will return an error.
  Future<void> _determineCurrentUserPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    final location = await Geolocator.getCurrentPosition();
    locationData = location;
    log.wtf('location: ${location.timestamp}');
    log.wtf('location: ${location.latitude}');
    log.wtf('location: ${location.longitude}');
    //TODO: FIX Issue with awaiting the method placemarkcoordinate
    // List<Placemark> placemarks =
        // await placemarkFromCoordinates(location.latitude, location.longitude);
    // log.i('User is in: ${placemarks.first.isoCountryCode}');
    // log.i('User is in: ${placemarks.first.toJson()}');
    // userDataService.changeUserLocation(placemarks.first.isoCountryCode ?? 'US');
  }
}
