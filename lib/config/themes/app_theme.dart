import 'package:flutter/material.dart';

// usar colores hexadecimal con '0xFF' seguido del color
const Color _customColor = Color(0xFF5211D4);

const List<Color> _colorsTheme = [
  _customColor,
  Colors.blue,
  Colors.black,
  Colors.amber,
  Colors.pink
];

class AppTheme {
  late int indexOfColor;

  //Con esta forma se inicializa la variable selectedColor en vez de usar this._selectedColor = elParametro
  AppTheme({this.indexOfColor = 0})
      : assert(
            indexOfColor >= 0 &&
                indexOfColor <=
                    _colorsTheme.length, //debe ser >= a 9 o se dispara el error
            "The value of index is out of range, must be 0 to ${_colorsTheme.length}");

  ThemeData theme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorsTheme[indexOfColor],
      //activa el modo oscuro
      // brightness: Brightness.dark
    );
  }
}
