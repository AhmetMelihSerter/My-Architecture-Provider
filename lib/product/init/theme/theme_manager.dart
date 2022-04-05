import 'package:flutter/material.dart';

import 'i_theme_manager.dart';

class ThemeManager extends IThemeManager {
  @override
  Color get primaryVariant => const Color.fromARGB(255, 55, 165, 79);

  @override
  Color get greyColor => const Color(0xFFf2f2f2);

  @override
  ThemeData get theme {
    return ThemeData(
      brightness: Brightness.light,
      appBarTheme: const AppBarTheme(
        titleTextStyle: TextStyle(
          fontSize: 22,
        ),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        centerTitle: true,
      ),
    );
  }
}
