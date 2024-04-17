import 'package:flutter/material.dart';

const Color _customColor = Color(0xFF5c11d4);

const List<Color> _colorThemes = [
  _customColor,
  Colors.lightBlue,
  Colors.teal,
  Colors.lightGreen,
  Colors.yellow,
  Colors.orange,
  Colors.pink
];

class AppTheme {
  final int selectedColor;
  AppTheme({required this.selectedColor})
      : assert(selectedColor >= 0 && selectedColor < _colorThemes.length,
            'Colors must be between 0 and ${_colorThemes.length - 1}');
  ThemeData theme() {
    return ThemeData(
      colorSchemeSeed: _colorThemes[selectedColor > 6 ? 0 : selectedColor],
    );
  }
}
