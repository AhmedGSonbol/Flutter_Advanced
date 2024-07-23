import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/theming/colors.dart';

class Themes
{
  static ThemeData whiteTheme = ThemeData(
      fontFamily: 'Inter',
      primaryColor: ColorsManager.mainColor,
      scaffoldBackgroundColor: Colors.white
  );
}