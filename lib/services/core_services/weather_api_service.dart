import 'dart:io';

import 'package:dio/dio.dart';
import 'package:weather_app/app/app.logger.dart';
import 'package:weather_app/app/locator_service.dart';
import 'package:weather_app/model/weather.dart';
import 'package:weather_app/utilities/api_handlers/api_key.dart';
import 'package:weather_app/utilities/api_handlers/api_response_handler.dart';
import 'package:weather_app/utilities/api_handlers/dio_interceptors.dart';
import 'package:weather_app/utilities/enums.dart';

/// Wrapper around the open weather map api
/// https://openweathermap.org/current
class WeatherApiService {
  final log = getLogger('WeatherApiService');

  final dio = Dio();

  final String apiKey = ApiKey.openWeatherMap;

  final String baseUrl = 'http://api.openweathermap.org';

  WeatherApiService() {
    dio.interceptors.add(DioInterceptor());
    dio.options.sendTimeout = const Duration(seconds: 30000);
    dio.options.receiveTimeout = const Duration(seconds: 30000);
    dio.options.baseUrl = baseUrl;

    log.i('Weather_API constructed and DIO setup registered');
  }

  Future<String?> getCityNameFromLocation(
      {required double latitude, required double longitude}) async {
    final url =
        '$baseUrl/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey';
    final ApiResponse? res = await get(url: url);
    //TODO:
  }

  Future<WeatherResponse> getWeatherData(String cityName) async {
    log.e('waiting  ');
    final url = '$baseUrl/data/2.5/weather?q=$cityName&appid=$apiKey';

    final ApiResponse? res = await get(url: url);

    if (res != null && res.statusCode == 200) {
      log.e(res.data);
      log.e(res.statusCode);
      log.e(res.statusMessage);
      return WeatherResponse.fromJson(res.data);
    } else {
      return WeatherResponse();
    }
  }

  Future<List<Weather>> getForecast(String cityName) async {
    final url = '$baseUrl/data/2.5/forecast?q=$cityName&appid=$apiKey';

    final ApiResponse? res = await get(url: url);
    //TODO:

    return [];
  }

  Future<ApiResponse?> get({required String url}) async {
    if (connectivityService.hasConnection) {
      log.i('Making request to $url');

      try {
        final response = await dio.get(url);

        log.i('Response from $url \n${response.data}');
        final res = ApiUtils.toApiResponse(response);
        return res;
      } on DioError catch (e) {
        var msg = 'Something went wrong';

        snackbarService.showCustomSnackBar(
          duration: const Duration(seconds: 3),
          variant: SnackbarType.failure,
          message: msg,
        );
        log.wtf('From $url  - ${e.response?.data?.toString()}');
        final res = ApiUtils.toApiResponse(e.response);
        return res;
      } on SocketException catch (e) {
        snackbarService.showCustomSnackBar(
          duration: const Duration(seconds: 3),
          variant: SnackbarType.failure,
          message: 'Please check your internet.',
        );
        log.wtf('From $url  - ${e.message.toString()}');
        return null;
      } catch (e) {
        snackbarService.showCustomSnackBar(
          message: e.toString(),
          variant: SnackbarType.failure,
          duration: const Duration(seconds: 3),
        );
        return null;
      }
    } else {
      snackbarService.showCustomSnackBar(
        message: 'Please check your internet',
        variant: SnackbarType.failure,
        duration: const Duration(seconds: 3),
      );
      return null;
    }
  }
}
