import 'package:flutter/material.dart';

class CityListDialog extends StatefulWidget {
  final List<String> cities;
  final Function(List<String>) onSelectedCitiesChanged;

  CityListDialog({required this.cities, required this.onSelectedCitiesChanged});

  @override
  _CityListDialogState createState() => _CityListDialogState();
}

class _CityListDialogState extends State<CityListDialog> {
  List<String> _selectedCities = [];

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Select 3 cities'),
      content: Container(
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
          child: Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: Text('OK'),
          onPressed: _selectedCities.length == 3
              ? () {
                  widget.onSelectedCitiesChanged(_selectedCities);
                  Navigator.of(context).pop();
                }
              : null,
        ),
      ],
    );
  }
}
