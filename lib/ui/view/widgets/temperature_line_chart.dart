// import 'package:charts_flutter/flutter.dart';
// import 'package:flutter/material.dart';
// import 'package:weather_app/model/weather.dart';
// import 'package:weather_app/utilities/themes.dart';

// /// Renders a line chart from forecast data
// /// x axis - date
// /// y axis - temperature
// class TemperatureLineChart extends StatelessWidget {
//   final List<Weather> weathers;
//   final bool animate;

//   const TemperatureLineChart(this.weathers, {super.key, required this.animate});

//   @override
//   Widget build(BuildContext context) {
//     ThemeData theme = Themes.getTheme(Themes.DARK_THEME_CODE);
//     return Padding(
//         padding: const EdgeInsets.all(40.0),
//         child: charts.TimeSeriesChart([
//           charts.Series<Weather, DateTime>(
//             id: 'Temperature',
//             colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
//             domainFn: (Weather weather, _) =>
//                 DateTime.fromMillisecondsSinceEpoch(weather.time! * 1000),
//             // measureFn: (Weather weather, _) =>
//             //     weather.temperature.as(AppStateContainer.of(context).temperatureUnit),
//             data: weathers,
//           )
//         ],
//             animate: animate,
//             animationDuration: const Duration(milliseconds: 500),
//             primaryMeasureAxis: charts.NumericAxisSpec(
//                 tickProviderSpec:
//                     charts.BasicNumericTickProviderSpec(zeroBound: false))));
//   }
// }
