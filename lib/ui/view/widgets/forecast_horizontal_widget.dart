import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/model/weather.dart';
import 'package:weather_app/ui/view/widgets/value_tile.dart';
import 'package:weather_app/utilities/themes.dart';

/// Renders a horizontal scrolling list of weather conditions
/// Used to show forecast
/// Shows DateTime, Weather Condition icon and Temperature
class ForecastHorizontal extends StatelessWidget {
  const ForecastHorizontal({
    Key? key,
    required this.weathers,
  }) : super(key: key);

  final List<WeatherResponse> weathers;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Themes.getTheme(Themes.DARK_THEME_CODE);
    return SizedBox(
      height: 70,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: weathers.length,
        separatorBuilder: (context, index) => const Divider(
          height: 100,
          color: Colors.white,
        ),
        padding: const EdgeInsets.only(left: 10, right: 10),
        itemBuilder: (context, index) {
          final item = weathers[index];
          return Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Center(
              child: ValueTile(
                DateFormat('E, ha').format(
                  DateTime.fromMillisecondsSinceEpoch(item.timezone! * 1000),
                ),
                iconData: item.weather![0].getIconData(),
                '${item.main!.temp}°',
              ),
            ),
          );
        },
      ),
    );
  }
}
