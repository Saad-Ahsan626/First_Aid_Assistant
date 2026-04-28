import 'package:flutter/material.dart';
import 'package:flutter_riverpod/legacy.dart';

final themeModeProvider = StateProvider<ThemeMode>((ref) => ThemeMode.light);

class AppTheme {
  static const Color primaryTeal = Color(0xFF129490);

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: primaryTeal,
      scaffoldBackgroundColor: Colors.grey.shade50,

      colorScheme: const ColorScheme.light(
        primary: primaryTeal,
        surface: Colors.white,
        onSurface: Colors.black87,
      ),

      cardColor: Colors.white,
      appBarTheme: const AppBarTheme(
        backgroundColor: primaryTeal,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        hintStyle: TextStyle(color: Colors.grey.shade400),
        prefixIconColor: primaryTeal,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: primaryTeal, width: 2),
        ),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      primaryColor: primaryTeal,
      scaffoldBackgroundColor: const Color(0xFF121212),
      cardColor: const Color(0xFF1E1E1E),

      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF121212), // Match the background
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),

      colorScheme: const ColorScheme.dark(
        primary: Colors.tealAccent, // Brighter teal for dark mode
        surface: Color(0xFF1E1E1E),
        onSurface: Colors.white70, // Soft white text
      ),

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: const Color(0xFF1E1E1E), // Match the cards
        hintStyle: const TextStyle(color: Colors.white38),
        prefixIconColor: Colors.tealAccent,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none, // Clean, borderless look
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Colors.tealAccent, width: 1.5),
        ),
      ),
    );
  }
}
