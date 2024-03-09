import 'package:flutter/material.dart';
import 'package:slash/core/theme/my_colors.dart';

class MyTheme {
  static ThemeData darkTheme = ThemeData(
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.white),
      bodyMedium: TextStyle(color: Colors.white),
      titleLarge: TextStyle(color: Colors.white),
    ),
    appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: MyColors.blackColor),
    scaffoldBackgroundColor: MyColors.blackColor,
    useMaterial3: true,
  );
}
