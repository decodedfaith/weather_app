import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:weather_app/model/weather.dart';
import 'package:weather_app/ui/view/weather_screen/weather_screen_viewmodel.dart';
import 'package:weather_app/ui/view/widgets/weather_widget.dart';
import 'package:weather_app/utilities/enums.dart';

class WeatherScreenView extends HookWidget {
  const WeatherScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    




    TabController tabController = useTabController(initialLength: 3);
    AnimationController fadeController =
        useAnimationController(duration: const Duration(milliseconds: 1000));
    Animation<double> fadeAnimation =
        CurvedAnimation(parent: fadeController, curve: Curves.easeIn);

        
    return ViewModelBuilder<WeatherScreenViewModel>.reactive(
      onViewModelReady: (model) => model.initState(),
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
          actions: <Widget>[
            PopupMenuButton<OptionsMenu>(
                onSelected: ((value) {
                  model.onOptionMenuItemSelected;
                }),
                itemBuilder: (context) => <PopupMenuEntry<OptionsMenu>>[
                      const PopupMenuItem<OptionsMenu>(
                        value: OptionsMenu.changeCity,
                        child: Text("change cities"),
                      ),
                      const PopupMenuItem<OptionsMenu>(
                        value: OptionsMenu.currentLocationWeather,
                        child: Text("current location weather"),
                      ),
                      const PopupMenuItem<OptionsMenu>(
                        value: OptionsMenu.settings,
                        child: Text("settings"),
                      ),
                    ],
                child: Icon(
                  Icons.more_vert,
                  color: model.theme.colorScheme.secondary,
                ))
          ],
        ),
        backgroundColor: Colors.white,
        body: Material(
          child: FutureBuilder<List<WeatherResponse>>(
            future: model.fetchWeatherWithCities(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                fadeController.reset();
                fadeController.forward();
                return Column(
                  children: [
                    TabBar(
                      controller: tabController,
                      labelColor: Colors.black,
                      indicatorColor: Colors.black,
                      tabs: <Widget>[
                        Tab(text: model.citiesWeatherResponse[0].name),
                        Tab(text: model.citiesWeatherResponse[1].name),
                        Tab(text: model.citiesWeatherResponse[2].name),
                      ],
                    ),
                    Expanded(
                      child: Container(
                        constraints: const BoxConstraints.expand(),
                        decoration:
                            BoxDecoration(color: model.theme.primaryColor),
                        child: FadeTransition(
                          opacity: fadeAnimation,
                          child: TabBarView(
                            controller: tabController,
                            children: model.citiesWeatherResponse
                                .map((e) => WeatherWidget(
                                      weather: e,
                                      theme: model.theme,
                                    ))
                                .toList(),
                          ),
                        ),
                      ),
                    ),
                  ],
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
      viewModelBuilder: () => WeatherScreenViewModel(),
    );
  }
}
