import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // ============================================================
  // PREMIUM LUXURY DARK PALETTE
  // ============================================================

  static const Color background = Color(0xFF020A3A);

  static const Color backgroundSecondary = Color(0xFF0F1213);

  static const Color surface = Color(0xFF121516);

  static const Color surfaceLight = Color(0xFF181B1C);

  static const Color surfaceElevated = Color(0xFF1C1F20);

  static const Color primaryText = Color(0xFFF2EEE5);

  static const Color secondaryText = Color(0xFFA6A49D);

  static const Color mutedText = Color(0xFF72736F);

  static const Color border = Color(0xFF292D2E);

  static const Color borderLight = Color(0xFF35393A);

  // Champagne / luxury accent
  static const Color accent = Color(0xFFC8A96B);

  static const Color accentLight = Color(0xFFE0C58A);

  static const Color accentDark = Color(0xFF8F7444);

  // Status
  static const Color success = Color(0xFF7FD39A);

  static ThemeData get darkTheme {
    final base = ThemeData.dark();

    return base.copyWith(
      brightness: Brightness.dark,

      scaffoldBackgroundColor: background,

      primaryColor: accent,

      colorScheme: const ColorScheme.dark(
        primary: accent,
        onPrimary: Color(0xFF11100D),

        secondary: accentLight,
        onSecondary: Color(0xFF11100D),

        surface: surface,
        onSurface: primaryText,

        error: Color(0xFFD97979),
        onError: Colors.white,
      ),

      textTheme: GoogleFonts.interTextTheme(
        base.textTheme,
      ).apply(bodyColor: primaryText, displayColor: primaryText),

      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        foregroundColor: primaryText,
        elevation: 0,
        centerTitle: false,
      ),

      dividerTheme: const DividerThemeData(
        color: border,
        thickness: 1,
        space: 1,
      ),

      cardTheme: CardThemeData(
        color: surface,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
          side: const BorderSide(color: border, width: 1),
        ),
      ),

      scrollbarTheme: ScrollbarThemeData(
        thumbColor: WidgetStateProperty.all(accent.withOpacity(0.45)),
        trackColor: WidgetStateProperty.all(Colors.transparent),
        radius: const Radius.circular(20),
        thickness: WidgetStateProperty.all(4),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: accent,
          foregroundColor: const Color(0xFF11100D),
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: GoogleFonts.inter(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.3,
          ),
        ),
      ),

      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: primaryText,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          side: const BorderSide(color: borderLight),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: GoogleFonts.inter(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.3,
          ),
        ),
      ),

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: surfaceLight,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 15,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: border),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: accent),
        ),
      ),
    );
  }
}
