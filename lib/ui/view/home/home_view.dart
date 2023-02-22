import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:weather_app/ui/view/home/home_view_model.dart';
import 'package:weather_app/ui/view/weather_screen/weather_screen_view.dart';

//BASE LANDING UI TO AWAIT INITIALISING THE APPS SERVICES, COULD AS WELL
//BE A SPLASH SCREEN
class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      onViewModelReady: (viewModel) => viewModel.initState(),
      builder: (context, model, child) {

        return FutureBuilder(
          future: Future.delayed(const Duration(seconds: 3), () {
            return const WeatherScreenView();
          }),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return const WeatherScreenView();
            } else {
              return const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
          },
        );
      },
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}
