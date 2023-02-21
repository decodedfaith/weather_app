// import 'package:dio/dio.dart';
// import 'package:stacked_services/stacked_services.dart';
// import 'package:weather_app/app/app.locator.dart';
// import 'package:weather_app/app/app.logger.dart';
// import 'package:weather_app/utilities/api_handlers/failures.dart';

// class WeatherAppApi {
//   final dio = Dio();
//   final log = getLogger('WeatherApiService');
//   final snackbar = locator<SnackbarService>();

//   WeatherAppApi(baseUrl) {
//     dio.interceptors.add(DioInterceptor());
//     dio.options.sendTimeout = 60000;
//     dio.options.receiveTimeout = 60000;
//     dio.options.baseUrl = baseUrl;
//     log.i('WeatherApp Api constructed and DIO setup register');
//   }

//   Failure handleApiError(DioError e) {
//     if (e.type == DioErrorType.cancel) {
//       return InputFailure(errorMessage: e.message);
//     } else if (e.type == DioErrorType.connectTimeout) {
//       return NetworkFailure();
//     } else if (e.type == DioErrorType.receiveTimeout) {
//       return NetworkFailure();
//     } else if (e.type == DioErrorType.sendTimeout) {
//       return NetworkFailure();
//     } else if (e.type == DioErrorType.response) {
//       return ServerFailure(error: e.message);
//     } else if (e.type == DioErrorType.other) {
//       return UnknownFailure();
//     } else {
//       return UnknownFailure();
//     }
//   }

//   Future fetchCityWeatherInfo(String params) async {
//     try {
//       final res = await dio.get(weatherBaseUrl + params + weatherApiKey);
//       log.i(res.data);
//       return WeatherDataModel.fromJson(res.data);
//     } on DioError catch (e) {
//       log.w(e.toString());
//       handleApiError(e);
//     }
//   }

//   Future<List<CitySearched>> fetchListOfSearchedCities(String params) async {
//     // try {
//     final res = await dio.get(
//       locationBaseUrl + params,
//       options: Options(
//         headers: {
//           'x-rapidapi-host': 'spott.p.rapidapi.com',
//           'x-rapidapi-key': placesApiKey,
//         },
//       ),
//     );
//     log.i(res.data);
//     return (res.data as List).map((e) => CitySearched.fromJson(e)).toList();

//     // } on DioError catch (e) {
//     //   log.w(e.toString());
//     //   handleApiError(e);
//     // }
//   }

//   Future<List<LocationDescription>> rfetchListOfSearchedCities(
//       String input) async {
//     // try {
//     final res = await dio.get(
//       googleLocationBaseUrl + googleLocationParams + input,
//     );
//     log.i(res.data);
//     return GoogleLocationApiModel.fromJson(res.data).predictions!;
    

//     // } on DioError catch (e) {
//     //   log.w(e.toString());
//     //   handleApiError(e);
//     // }
//   }
// }
