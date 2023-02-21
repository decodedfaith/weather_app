import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/model/weather.dart';
import 'package:weather_app/ui/view/widgets/forecast_horizontal_widget.dart';
import 'package:weather_app/ui/view/widgets/value_tile.dart';
import 'package:weather_app/utilities/themes.dart';

class WeatherWidget extends StatelessWidget {
  final WeatherResponse weather;
  final ThemeData theme;

  const WeatherWidget({super.key, required this.weather, required this.theme});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            weather.name != null ? weather.name!.toUpperCase() : 'ddddd',
            style: TextStyle(
                fontWeight: FontWeight.w900,
                letterSpacing: 5,
                color: theme.colorScheme.secondary,
                fontSize: 25),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            weather.weather![0].description!.toUpperCase(),
            style: TextStyle(
                fontWeight: FontWeight.w100,
                letterSpacing: 5,
                fontSize: 15,
                color: theme.colorScheme.secondary),
          ),
          // WeatherSwipePager(weather: weather),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Divider(
              color: theme.colorScheme.secondary.withAlpha(50),
            ),
          ),
          ForecastHorizontal(weathers: [weather]),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Divider(
              color: theme.colorScheme.secondary.withAlpha(50),
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            ValueTile("wind speed", '${weather.wind!.speed} m/s'),
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
              "sunrise",
              DateFormat('h:m a').format(DateTime.fromMillisecondsSinceEpoch(
                  weather.sys!.sunrise! * 1000)),
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
                "sunset",
                DateFormat('h:m a').format(DateTime.fromMillisecondsSinceEpoch(
                    weather.sys!.sunset! * 1000))),
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
              "humidity",
              '${weather.main!.humidity}%',
              iconData: null,
            ),
          ]),
        ],
      ),
    );
  }
}
