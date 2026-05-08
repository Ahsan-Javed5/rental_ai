import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/constants/app_strings.dart';
import '../core/constants/app_routes.dart';

class TextAnalysisController extends GetxController {
  final TextEditingController questionController = TextEditingController();

  void analyzeQuestion() {
    Get.toNamed(
      AppRoutes.result,
      arguments: AppStrings.dummyResponse,
    );
  }
}
