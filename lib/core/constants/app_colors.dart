import 'package:flutter/material.dart';

class AppColors {
  // --- Core Colors ---
  static const Color primary = Color(0xFF1A3351);
  static const Color secondary =
      Color(0xFF4DA8DA); // Same light blue for highlights
  static const Color background = Color(0xFFF8F9FB); // Cleaner off-white

  // --- Luxury Accents ---
  static const Color gold = Color(0xFFD4AF37); // Metallic Gold
  static const Color goldLight =
      Color(0xFFFFEFA1); // For gold highlights/gradients
  static const Color obsidian = Color(0xFF0F0F12); // Premium Dark Black

  // --- Neutrals ---
  static const Color white = Colors.white;
  static const Color textDark = Color(0xFF121212); // Stronger dark text
  static const Color textLight = Color(0xFF6E7C87); // Soft slate gray

  // --- Status ---
  static const Color success = Color(0xFF22C55E); // Modern vibrant green
  static const Color danger = Color(0xFFEF4444); // Modern soft red

  // --- Reusable Gradients  ---
  static const Gradient primaryGradient = LinearGradient(
    colors: [obsidian, primary],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const Gradient goldGradient = LinearGradient(
    colors: [gold, Color(0xFFB8860B)], // Gold to Dark Gold
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
