import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:weather_app/ui/view/locations/locations_view_model.dart';

class LocationsView extends StatelessWidget {
  const LocationsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LocationsViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: Container(
          
        ),
      ),
      viewModelBuilder: () => LocationsViewModel(),
    );
  }
}
