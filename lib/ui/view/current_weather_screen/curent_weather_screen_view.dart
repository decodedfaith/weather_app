import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:weather_app/model/weather.dart';
import 'package:weather_app/ui/view/current_weather_screen/current_wweaather_screen_viewmodel.dart';
import 'package:weather_app/ui/view/widgets/weather_widget.dart';

class CurrentWeatherScreenView extends HookWidget {
  const CurrentWeatherScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AnimationController fadeController =
        useAnimationController(duration: const Duration(milliseconds: 1000));
    Animation<double> fadeAnimation =
        CurvedAnimation(parent: fadeController, curve: Curves.easeIn);

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
          child: FutureBuilder<WeatherResponse>(
            future: model.fetchWeatherWithLocation(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                fadeController.reset();
                fadeController.forward();
                return WeatherWidget(
                  weather: snapshot.data!,
                  theme: model.theme,
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
      viewModelBuilder: () => CurrentWeatherScreenViewModel(),
    );
  }
}
