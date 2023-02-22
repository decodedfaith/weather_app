import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:weather_app/utilities/cities.dart';

class CitySelectorDialog extends StatefulWidget {
  const CitySelectorDialog({Key? key}) : super(key: key);

  @override
  CitySelectorDialogState createState() => CitySelectorDialogState();
}

class CitySelectorDialogState extends State<CitySelectorDialog> {
  final List<String> _selectedCities = [];

  void _onCitySelected(String city, bool value) {
    setState(() {
      if (value == true) {
        if (_selectedCities.length < 3) {
          _selectedCities.add(city);
        }
      } else {
        _selectedCities.remove(city);
      }
    });
  }

  void _onOkPressed() {
    if (_selectedCities.length == 3) {
      Navigator.of(context).pop(DialogResponse(
        confirmed: true,
        data: _selectedCities,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Select up to 3 cities',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: Cities.cities.length,
                itemBuilder: (context, index) {
                  final city = Cities.cities[index];
                  return CheckboxListTile(
                    title: Text(city),
                    value: _selectedCities.contains(city),
                    onChanged: (bool? value) {
                      _onCitySelected(city, value ?? false);
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _onOkPressed,
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: _selectedCities.length == 3
                    ? Theme.of(context).colorScheme.secondary
                    : Colors.grey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: const Text('OK'),
            ),
          ],
        ),
      ),
    );
  }
}
