import 'package:dio/dio.dart';
import 'package:weather_app/app/app.logger.dart';
import 'package:weather_app/utilities/api_handlers/dio_interceptors.dart';

class WeatherApiService {
  final log = getLogger('ApiService');

  final dio = Dio();

  final String baseUrl = 'https://openweathermap.org/';

  WeatherApiService() {
    dio.interceptors.add(DioInterceptor());
    dio.options.sendTimeout = const Duration(seconds: 30000);
    dio.options.receiveTimeout = const Duration(seconds: 30000);
    dio.options.baseUrl = baseUrl;

    log.i('Weather_API constructed and DIO setup registered');
  }
}
