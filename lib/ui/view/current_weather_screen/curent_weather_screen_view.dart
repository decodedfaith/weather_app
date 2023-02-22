import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:weather_app/model/weather.dart';
import 'package:weather_app/ui/view/current_weather_screen/current_weather_screen_viewmodel.dart';
import 'package:weather_app/ui/view/widgets/weather_widget.dart';

class CurrentWeatherScreenView extends HookWidget {
  const CurrentWeatherScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AnimationController fadeController =
        useAnimationController(duration: const Duration(milliseconds: 1000));

    return ViewModelBuilder<CurrentWeatherScreenViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: model.theme.primaryColor,
          elevation: 0,
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                DateFormat('EEEE, d MMMM yyyy').format(DateTime.now()),
                style: TextStyle(
                    color: model.theme.colorScheme.secondary.withAlpha(80),
                    fontSize: 14),
              )
            ],
          ),
        ),
        backgroundColor: Colors.white,
        body: Material(
          color: model.theme.primaryColor,
          child: FutureBuilder<WeatherResponse>(
            future: model.fetchWeatherWithLocation(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              fadeController.reset();
              fadeController.forward();
              print('kkikikkkkk');
              // return Text('hhhhhhhhhhhhhhhhhhh');
              return WeatherWidget(
                weather: model.weather!,
                theme: model.theme,
              );
            },
          ),
        ),
      ),
      viewModelBuilder: () => CurrentWeatherScreenViewModel(),
    );
  }
}
