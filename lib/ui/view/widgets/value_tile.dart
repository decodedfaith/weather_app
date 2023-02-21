// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:weather_app/ui/view/widgets/empty_widget.dart';
import 'package:weather_app/utilities/themes.dart';

/// General utility widget used to render a cell divided into three rows
/// First row displays [label]
/// second row displays [iconData]
/// third row displays [value]
class ValueTile extends StatelessWidget {
  final String label;
  final String value;
  final IconData? iconData;

  const ValueTile(this.label, this.value, {super.key,  this.iconData});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Themes.getTheme(Themes.DARK_THEME_CODE);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          label,
          style: TextStyle(
              color: theme
                  .colorScheme.secondary
                  .withAlpha(80)),
        ),
        const SizedBox(
          height: 5,
        ),
        iconData != null
            ? Icon(
                iconData,
                color: theme.colorScheme.secondary,
                size: 20,
              )
            : EmptyWidget(),
        const SizedBox(
          height: 10,
        ),
        Text(
          value,
          style:
              TextStyle(color: theme.colorScheme.secondary),
        ),
      ],
    );
  }
}
