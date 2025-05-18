import 'package:flutter/material.dart';


class AppTheme {
  static const Color backgroundColor = Color(0xFF1F1D2B);
  static const Color textColor = Color(0xFFFFFFFF);
  static const Color bottomNavColor = Color(0xFF252836);
  static const Color unselectedOnboardingColor = Color(0xFF7B8085);
  static const Color selectedOnboardingColor = Color(0xFF525298);
  static const Color categoryContainerBgColor = Color(0xFF2F3142);
  static const Color searchBarBgColor = Color(0x1AFFFFFF);
  static const Color searchBarHintColor = Color(0x89FFFFFF);
  static const Color categorySelectedBgColor = Color(0x33FFFFFF);
  static const Color categoryBorderColor = Color(0xFF2F3142);

  static const TextStyle appTitleStyle = TextStyle(
    color: Colors.white,
    fontSize: 18,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.bold,
  );

  static const TextStyle searchBarStyle = TextStyle(
    color: Colors.white,
    fontSize: 14,
  );

  static const TextStyle searchBarHintStyle = TextStyle(
    color: searchBarHintColor,
    fontSize: 14,
    fontFamily: 'Inter-SemiBold',
  );

  static const TextStyle categoryTextStyle = TextStyle(
    color: Color(0xFFF9F9FA),
    fontSize: 15,
    fontFamily: 'Inter-SemiBold',
  );

  static const TextStyle trendingTitleStyle = TextStyle(
    color: Colors.white,
    fontSize: 24,
    fontFamily: 'Inter-Bold',
    fontWeight: FontWeight.bold,
  );

  static const TextStyle podcastTitleStyle = TextStyle(
    color: Colors.white,
    fontFamily: 'Inter',
    fontWeight: FontWeight.bold,
    fontSize: 15,
  );

  static const TextStyle podcastAuthorStyle = TextStyle(
    color: Color(0xFFC4C4C4),
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,
    fontSize: 12,
  );

  static ThemeData get darkTheme {
    return ThemeData(
      scaffoldBackgroundColor: backgroundColor,
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: textColor),
        bodyMedium: TextStyle(color: textColor),
        bodySmall: TextStyle(color: textColor),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: bottomNavColor,
        selectedItemColor: textColor,
        unselectedItemColor: unselectedOnboardingColor,
      ),
      colorScheme: ColorScheme.dark(
        background: backgroundColor,
        primary: selectedOnboardingColor,
        secondary: unselectedOnboardingColor,
        surface: categoryContainerBgColor,
      ),
    );
  }

  static ThemeData get lightTheme {
    return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Colors.black),
        bodyMedium: TextStyle(color: Colors.black),
        bodySmall: TextStyle(color: Colors.black),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Color(0xFFF5F5F5),
        selectedItemColor: Color(0xFF525298),
        unselectedItemColor: Color(0xFF7B8085),
      ),
      colorScheme: ColorScheme.light(
        background: Colors.white,
        primary: Color(0xFF525298),
        secondary: Color(0xFF7B8085),
        surface: Color(0xFFF5F5F5),
      ),
    );
  }
} 