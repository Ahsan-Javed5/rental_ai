import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/api/api_service.dart';
import '../core/constants/app_routes.dart';

class AgreementController extends GetxController {
  final TextEditingController agreementController = TextEditingController();

  final ApiService _apiService = ApiService();

  RxBool isLoading = false.obs;

  Future<void> analyzeAgreement() async {
    try {
      isLoading.value = true;

      final response = await _apiService.analyzeAgreement(
        agreementController.text.trim(),
      );
      final summary = response.results.map((e) => e['analysis']).join("\n\n");
      Get.toNamed(
        AppRoutes.result,
        arguments: summary,
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
