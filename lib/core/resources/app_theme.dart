import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'colors_manager.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: ColorsManager.backgroundColor,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      scrolledUnderElevation: 0,
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: ColorsManager.yellow,
      selectionHandleColor: ColorsManager.yellow,
      selectionColor: ColorsManager.yellow.withAlpha(30)
    ),
    colorScheme: ColorScheme.light(
      primary: ColorsManager.backgroundColor,
      onPrimary: ColorsManager.white,
      secondary: ColorsManager.secondaryColor,
      onPrimaryContainer: ColorsManager.yellow,
      error: ColorsManager.red,
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        fontSize: 36.sp,
        fontWeight: .w500,
        color: ColorsManager.white,
      ),
      bodyMedium: TextStyle(
        fontSize: 24.sp,
        fontWeight: .w700,
        color: ColorsManager.white,
      ),
      bodySmall: TextStyle(
        fontSize: 20.sp,
        fontWeight: .w400,
        color: ColorsManager.white,
      ),
      displayMedium: TextStyle(
        fontSize: 20.sp,
        fontWeight: .w600,
        color: ColorsManager.backgroundColor,
      ),
      labelSmall:
      TextStyle(
        fontSize: 16.sp,
        fontWeight: .w400,
        color: ColorsManager.white,
      ),
      displaySmall:
      TextStyle(
        fontSize: 18.sp,
        fontWeight: .w400,
        color: ColorsManager.yellow,
      ),
    ),
  );
}
