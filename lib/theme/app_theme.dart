import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color(0xFFFF8C42);
  static const Color dark = Color(0xFF1E1E1E);
  static const Color bg = Color(0xFFF5F5F5);

  static ThemeData get lightTheme => ThemeData(
        primaryColor: primary,
        scaffoldBackgroundColor: bg,
        fontFamily: 'Poppins',
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Colors.black,
        ),
      );
}
