import 'package:flutter/material.dart';
import './app_color.dart';
class AppTheme {
  const AppTheme._();

  static ThemeData lightAppTheme = ThemeData(
    scaffoldBackgroundColor: AppColor.background,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(12),
        backgroundColor: AppColor.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12), // <-- Radius
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: AppColor.primary),
    ),
    iconTheme: const IconThemeData(color: AppColor.primary),
    textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        displayMedium: TextStyle(
          fontSize: 19,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
        displaySmall: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
        headlineMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
        headlineSmall: TextStyle(fontSize: 15, color: Colors.grey),
        titleLarge: TextStyle(fontSize: 12)),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
    ),
  );
}
