import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/constants/app_routes.dart';
import '../core/constants/app_strings.dart';

class AgreementController extends GetxController {
  final TextEditingController agreementController = TextEditingController();

  void analyzeAgreement() {
    Get.toNamed(
      AppRoutes.result,
      arguments: AppStrings.dummyResponse,
    );
  }
}
