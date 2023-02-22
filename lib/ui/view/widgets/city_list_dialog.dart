import 'package:flutter/material.dart';

class CityListDialog extends StatefulWidget {
  final List<String> cities;
  final Function(List<String>) onSelectedCitiesChanged;

  const CityListDialog({super.key, required this.cities, required this.onSelectedCitiesChanged});

  @override
  CityListDialogState createState() => CityListDialogState();
}

class CityListDialogState extends State<CityListDialog> {
  final List<String> _selectedCities = [];

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Select 3 cities'),
      content: SizedBox(
        width: double.maxFinite,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: widget.cities.length,
          itemBuilder: (BuildContext context, int index) {
            final city = widget.cities[index];
            return CheckboxListTile(
              title: Text(city),
              value: _selectedCities.contains(city),
              onChanged: (bool? value) {
                setState(() {
                  if (value == true) {
                    _selectedCities.add(city);
                  } else {
                    _selectedCities.remove(city);
                  }
                });
              },
            );
          },
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          onPressed: _selectedCities.length == 3
              ? () {
                  widget.onSelectedCitiesChanged(_selectedCities);
                  Navigator.of(context).pop();
                }
              : null,
          child: const Text('OK'),
        ),
      ],
    );
  }
}
