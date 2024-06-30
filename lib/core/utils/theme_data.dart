import 'package:admin/core/utils/color_const.dart';
import 'package:flutter/material.dart';

class Styles {
  static ThemeData themeData({
    required bool isDarkTheme,
    required context,
  }) {
    return ThemeData(
      appBarTheme: AppBarTheme(
        backgroundColor: isDarkTheme ? AppColor.darkScaffoldColor : AppColor.lightScaffoldColor
      ),
      scaffoldBackgroundColor:
      isDarkTheme ? AppColor.darkScaffoldColor : AppColor.lightScaffoldColor,
    cardColor: isDarkTheme ? const Color.fromARGB(255, 13, 6, 37) : AppColor.lightCardColor,
    brightness: isDarkTheme? Brightness.dark :Brightness.light,
    );
  }
}
