import 'package:flutter/material.dart';

import 'package:assarickym/app/resource/color_manager.dart';

import 'font_manager.dart';

class ThemeManager {
  ThemeManager._();

  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    fontFamily: FontConstants.fontFamilyPoppins,
    scaffoldBackgroundColor: Colors.white,
    extensions: [
      CustomColors(
        backgroundColor1: whiteColor,
        blackCColor: blackColor,
        green: greenColor,
        blues: bluesColor,
        milk: milkColor,
        orange: orangeColor,
        transParentColor: transParentColor,
        whiteCColor: whiteColor,
        yellow: yellowColor,
      ),
    ],
  );

  static final darkTheme = ThemeData(
      brightness: Brightness.dark,
      fontFamily: FontConstants.fontFamilyPoppins,
      scaffoldBackgroundColor: blackColor,
      extensions: [
        CustomColors(
          backgroundColor1: blackColor,
          blackCColor: blackColor,
          green: greenColor,
          blues: bluesColor,
          milk: milkColor,
          orange: orangeColor,
          transParentColor: transParentColor,
          whiteCColor: whiteColor,
          yellow: yellowColor,
        ),
      ]);
}

class CustomColors extends ThemeExtension<CustomColors> {
  final Color backgroundColor1;
  final Color milk;
  final Color blues;
  final Color yellow;
  final Color green;
  final Color orange;
  final Color transParentColor;

  final Color blackCColor;
  final Color whiteCColor;

  CustomColors({
    required this.backgroundColor1,
    required this.milk,
    required this.blues,
    required this.yellow,
    required this.green,
    required this.orange,
    required this.transParentColor,
    required this.blackCColor,
    required this.whiteCColor,
  });

  @override
  ThemeExtension<CustomColors> copyWith() {
    return CustomColors(
      backgroundColor1: backgroundColor1,
      blackCColor: blackColor,
      whiteCColor: whiteColor,
      blues: bluesColor,
      green: greenColor,
      milk: milkColor,
      orange: orangeColor,
      transParentColor: transParentColor,
      yellow: yellowColor,
    );
  }

  @override
  ThemeExtension<CustomColors> lerp(
      covariant ThemeExtension<CustomColors>? other, double t) {
    if (other is! CustomColors) {
      return this;
    }
    return CustomColors(
      backgroundColor1:
          Color.lerp(backgroundColor1, other.backgroundColor1, t)!,
      blackCColor: blackCColor,
      blues: bluesColor,
      green: greenColor,
      milk: milkColor,
      orange: orangeColor,
      transParentColor: transParentColor,
      whiteCColor: whiteColor,
      yellow: yellowColor,
    );
  }
}

extension ThemeExtansions on BuildContext {
  bool get isDarkMode {
    var brightness = Theme.of(this).brightness;
    return brightness == Brightness.dark;
  }

  bool get isLightMode {
    var brightness = Theme.of(this).brightness;
    return brightness == Brightness.light;
  }

  CustomColors get customColors {
    final customColors = Theme.of(this).extension<CustomColors>()!;
    return customColors;
  }
}
