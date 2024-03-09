import 'package:flutter/material.dart';
import 'package:slash/core/theme/my_colors.dart';

class MyTheme {
  static ThemeData darkTheme = ThemeData(
    appBarTheme: const AppBarTheme(backgroundColor: MyColors.blackColor),
    scaffoldBackgroundColor: MyColors.blackColor,
    useMaterial3: true,
  );
}
