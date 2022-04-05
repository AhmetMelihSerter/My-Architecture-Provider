import 'package:flutter/material.dart';

abstract class IThemeManager {

  Color get primaryVariant;
  Color get greyColor;

  ThemeData get theme;
}