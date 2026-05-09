import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rental_ai/core/widgets/custom_loader.dart';
import '../../controllers/agreement_controller.dart';
import '../../core/constants/app_strings.dart';
import '../../core/widgets/custom_button.dart';
import '../../core/widgets/custom_snack_bar.dart';
import '../../core/widgets/custom_textfield.dart';

class AgreementScreen extends StatelessWidget {
  const AgreementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AgreementController());

    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.pasteAgreement),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Expanded(
                  child: CustomTextField(
                    controller: controller.agreementController,
                    hint: AppStrings.agreementHint,
                    maxLines: 25,
                  ),
                ),
                const SizedBox(height: 20),
                CustomButton(
                  text: AppStrings.analyze,
                  onTap: () {
                    if (controller.agreementController.text.trim().isEmpty) {
                      CustomSnackBar.show(
                        title: AppStrings.emptyAgreement,
                        message: AppStrings.pleasePasteAgreement,
                      );
                    } else {
                      controller.analyzeAgreement();
                    }
                  },
                ),
              ],
            ),
          ),
          Obx(
            () => controller.isLoading.value
                ? Container(
                    color: Colors.black.withOpacity(0.3),
                    child: const Center(
                      child: CustomLoader(size: 100),
                    ),
                  )
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
