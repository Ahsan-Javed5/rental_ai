import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSnackBar {
  static void show({
    required String title,
    required String message,
    bool isError = true,
  }) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: const Color(0xFF1A1A1A),
      colorText: Colors.white,
      titleText: Text(
        title,
        style: const TextStyle(
          color: Color(0xFFD4AF37),
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
      messageText: Text(
        message,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 14,
        ),
      ),
      margin: const EdgeInsets.all(20),
      borderRadius: 15,
      borderWidth: 1.5,
      borderColor: const Color(0xFFD4AF37).withOpacity(0.6),
      icon: Icon(
        isError ? Icons.warning_amber_rounded : Icons.check_circle_outline,
        color: const Color(0xFFD4AF37),
        size: 28,
      ),
      duration: const Duration(seconds: 3),
      boxShadows: [
        BoxShadow(
          color: Colors.black.withOpacity(0.5),
          blurRadius: 10,
          offset: const Offset(0, 4),
        ),
      ],
    );
  }
}
