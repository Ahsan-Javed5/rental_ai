import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/api/api_service.dart';
import '../core/constants/app_routes.dart';

class TextAnalysisController extends GetxController {
  final TextEditingController questionController = TextEditingController();

  final ApiService _apiService = ApiService();

  RxBool isLoading = false.obs;

  Future<void> analyzeQuestion() async {
    try {
      isLoading.value = true;

      final response = await _apiService.askQuestion(
        questionController.text.trim(),
      );

      Get.toNamed(
        AppRoutes.result,
        arguments: response.answer,
      );
    } catch (e) {
      Get.snackbar(
        'Error',
        e.toString(),
      );
    } finally {
      isLoading.value = false;
    }
  }
}
