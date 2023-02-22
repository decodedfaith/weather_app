import 'package:flutter/material.dart';
import 'package:weather_app/model/weather.dart';
import 'package:weather_app/ui/view/widgets/value_tile.dart';
import 'package:weather_app/utilities/themes.dart';

/// Renders Weather Icon, current, min and max temperatures
class CurrentConditions extends StatelessWidget {
  final WeatherResponse weather;
  const CurrentConditions({Key? key, required this.weather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Themes.getTheme(Themes.darkThemeCode);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          weather.weather![0].getIconData(),
          color: theme.colorScheme.secondary,
          size: 70,
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          '${weather.main!.temp}°',
          style: TextStyle(
              fontSize: 100,
              fontWeight: FontWeight.w100,
              color: theme.colorScheme.secondary),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          ValueTile(
            "max",
            '${weather.main!.tempMax}°',
            iconData: null,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Center(
                child: Container(
              width: 1,
              height: 30,
              color: theme.colorScheme.secondary.withAlpha(50),
            )),
          ),
          ValueTile(
            "min",
            '${weather.main!.tempMin}°',
            iconData: null,
          ),
        ]),
      ],
    );
  }
}
