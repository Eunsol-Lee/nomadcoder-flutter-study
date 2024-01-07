import 'package:flutter/material.dart';
import 'package:mood_tracker/shared/index.dart';

const _basicTextStyle = TextStyle(
  fontFamily: FontFamily.roboto,
  fontWeight: FontWeight.bold,
);

_getBasicOutlineInputBorder({required double width}) => OutlineInputBorder(
      borderRadius: BorderRadius.circular(Sizes.size32),
      borderSide: BorderSide(width: width),
    );

final mtThemes = ThemeData(
  useMaterial3: true,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.amber.shade50,
    foregroundColor: Colors.black,
  ),
  colorScheme: ColorScheme.light(
    background: Colors.amber.shade50,
  ),
  textTheme: const TextTheme(
    titleLarge: _basicTextStyle,
    titleMedium: _basicTextStyle,
    titleSmall: _basicTextStyle,
    bodyLarge: _basicTextStyle,
  ),
  inputDecorationTheme: InputDecorationTheme(
    contentPadding: const EdgeInsets.symmetric(horizontal: Sizes.size24, vertical: Sizes.size10),
    border: _getBasicOutlineInputBorder(width: Sizes.size2),
    focusedBorder: _getBasicOutlineInputBorder(width: Sizes.size3),
    enabledBorder: _getBasicOutlineInputBorder(width: Sizes.size2),
    filled: true,
    fillColor: Colors.white,
    hintStyle: _basicTextStyle.copyWith(color: Colors.grey),
    labelStyle: _basicTextStyle.copyWith(color: ThemeData.light().primaryColor),
  ),
);
