import 'package:flutter/material.dart';
import 'package:sms_bring_flutter/core/colors/app_colors.dart';
import 'package:sms_bring_flutter/core/styles/styles.dart';

extension LightTheme on BuildContext {
  ThemeData get lightTheme => ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.primaryBackgroundColor,
          elevation: 0,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          hintStyle: TextStyle(
            color: AppColors.primaryColor,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.primaryColorLight),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.primaryColor),
          ),
        ),
        useMaterial3: true,
        primaryColorLight: AppColors.primaryColorLight,
        primarySwatch: Colors.orange,
        primaryColor: AppColors.primaryColor,
        secondaryHeaderColor: AppColors.secondaryColor,
        scaffoldBackgroundColor: AppColors.primaryBackgroundColor,
        cardColor: AppColors.secondaryBackgroundColor,
        fontFamily: 'Roboto',
        textTheme: const TextTheme(
          displayLarge: Styles.displayLarge,
          displayMedium: Styles.displayMedium,
          displaySmall: Styles.displaySmall,
          headlineLarge: Styles.headlineLarge,
          headlineMedium: Styles.headlineMedium,
          headlineSmall: Styles.headlineSmall,
          titleLarge: Styles.titleLarge,
          titleMedium: Styles.titleMedium,
          titleSmall: Styles.titleSmall,
          bodyLarge: Styles.bodyLarge,
          bodyMedium: Styles.bodyMedium,
          bodySmall: Styles.bodySmall,
          labelLarge: Styles.labelLarge,
          labelMedium: Styles.labelMedium,
          labelSmall: Styles.labelSmall,
        ),
        iconTheme: const IconThemeData(
          color: AppColors.primaryColor,
          size: 24.0,
        ),
        popupMenuTheme: const PopupMenuThemeData(
          color: AppColors.primaryBackgroundColor,
        ),
      );
}
