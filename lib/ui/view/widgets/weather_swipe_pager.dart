// import 'package:flutter/material.dart';
// import 'package:weather_app/model/weather.dart';
// import 'package:weather_app/ui/view/widgets/current_conditions.dart';
// import 'package:weather_app/ui/view/widgets/empty_widget.dart';
// import 'package:weather_app/utilities/themes.dart';

// class WeatherSwipePager extends StatelessWidget {
//   const WeatherSwipePager({
//     Key? key,
//     required this.weather,
//   }) : super(key: key);

//   final Weather weather;

//   @override
//   Widget build(BuildContext context) {
//         ThemeData theme = Themes.getTheme(Themes.DARK_THEME_CODE);

//     return SizedBox(
//       width: MediaQuery.of(context).size.width,
//       height: 300,
//       child: Swiper(
//         itemCount: 2,
//         index: 0,
//         itemBuilder: (context, index) {
//           if (index == 0) {
//             return CurrentConditions(
//               weather: weather,
//             );
//           } 
//           // else if (index == 1) {
//           //   return TemperatureLineChart(
//           //     [],
//           //     animate: true,
//           //   );
//           // }
//           return EmptyWidget();
//         },
//         pagination: SwiperPagination(
//             margin: const EdgeInsets.all(5.0),
//             builder: DotSwiperPaginationBuilder(
//                 size: 5,
//                 activeSize: 5,
//                 color:theme
//                     .colorScheme.secondary
//                     .withOpacity(0.4),
//                 activeColor:
//                 theme.colorScheme.secondary)),
//       ),
//     );
//   }
// }
