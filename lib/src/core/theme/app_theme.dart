import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';
import 'app_text_style.dart';

ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(ThemeMode.system);

/// Light theme
final ThemeData appTheme = ThemeData(
  primaryColor: AppColors.primary,
  scaffoldBackgroundColor: AppColors.white,
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey.shade300),
      borderRadius: BorderRadius.circular(10),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey.shade300),
      borderRadius: BorderRadius.circular(10),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.primary),
      borderRadius: BorderRadius.circular(10),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.red),
      borderRadius: BorderRadius.circular(10),
    ),
  ),
  appBarTheme: AppBarTheme(
    color: AppColors.white,
    centerTitle: true,
    surfaceTintColor: Colors.transparent,
    elevation: 1,
    iconTheme: IconThemeData(color: AppColors.gray),
    shadowColor: AppColors.lightGray,
    toolbarTextStyle: const TextTheme(
      titleLarge: AppTextStyle.xxxLargeBlack,
    ).bodyLarge,
    titleTextStyle: const TextTheme(
      titleLarge: AppTextStyle.xxxLargeBlack,
    ).titleLarge,
    systemOverlayStyle: SystemUiOverlayStyle.light,
  ),
  iconTheme: const IconThemeData(color: AppColors.black, size: 25),
  textTheme: const TextTheme(
    headlineLarge: AppTextStyle.xxxLargeBlack,
    headlineMedium: AppTextStyle.xLargeBlack,
    titleMedium: AppTextStyle.xSmallBlack,
    titleSmall: AppTextStyle.smallBlack,
    bodyLarge: AppTextStyle.largeBlack,
    bodyMedium: AppTextStyle.mediumBlack,
  ),
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.light,
    seedColor: AppColors.primary,
    primary: AppColors.primary,
    onPrimary: AppColors.onPrimaryLight,
    secondary: AppColors.secondary,
    onSecondary: AppColors.onSecondaryLight,
    tertiary: AppColors.tertiary,
    onTertiary: AppColors.onTertiaryLight,
  ).copyWith(
    primary: AppColors.primary,
    onPrimary: AppColors.onPrimaryLight,
    secondary: AppColors.secondary,
    onSecondary: AppColors.onSecondaryLight,
    tertiary: AppColors.tertiary,
    onTertiary: AppColors.onTertiaryLight,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.white,
      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  ),
);

/// Dark theme
final ThemeData darkAppTheme = ThemeData(
  scaffoldBackgroundColor: AppColors.dark,
  primaryColor: AppColors.primary,
  colorScheme: ColorScheme.fromSeed(
    contrastLevel: 1.0,
    brightness: Brightness.dark,
    seedColor: AppColors.primary,
    primary: AppColors.primary,
    onPrimary: AppColors.onPrimaryDark,
    secondary: AppColors.secondary,
    onSecondary: AppColors.onSecondaryDark,
    tertiary: AppColors.tertiary,
    onTertiary: AppColors.onTertiaryDark,
  ).copyWith(
    primary: AppColors.primary,
    onPrimary: AppColors.onPrimaryDark,
    secondary: AppColors.secondary,
    onSecondary: AppColors.onSecondaryDark,
    tertiary: AppColors.tertiary,
    onTertiary: AppColors.onTertiaryDark,
  ),
  appBarTheme: AppBarTheme(
    shadowColor: AppColors.lightGray,
    centerTitle: true,
    color: AppColors.dark,
    elevation: 1,
    surfaceTintColor: Colors.transparent,
    iconTheme: const IconThemeData(color: AppColors.white),
    toolbarTextStyle: const TextTheme(
      titleLarge: AppTextStyle.xxxLargeWhite,
    ).bodyLarge,
    titleTextStyle: const TextTheme(
      titleLarge: AppTextStyle.xxxLargeWhite,
    ).titleLarge,
    systemOverlayStyle: SystemUiOverlayStyle.light,
  ),
  iconTheme: const IconThemeData(color: AppColors.white, size: 25),
  textTheme: const TextTheme(
    headlineLarge: AppTextStyle.xxxLargeWhite,
    headlineMedium: AppTextStyle.xLargeWhite,
    titleMedium: AppTextStyle.xSmallWhite,
    titleSmall: AppTextStyle.smallWhite,
    bodyLarge: AppTextStyle.largeWhite,
    bodyMedium: AppTextStyle.mediumWhite,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.white,
      padding: EdgeInsets.symmetric(
        horizontal: 50,
        vertical: 12,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    contentPadding: EdgeInsets.symmetric(
      horizontal: 10,
    ),
    filled: true,
    suffixIconColor: AppColors.white,
    fillColor: AppColors.transparent,
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: AppColors.lightGray, width: 1)),
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide:  BorderSide(color: AppColors.lightGray, width: 1)),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: AppColors.lightGray, width: 1)),
    errorMaxLines: 2,
  ),
);
