import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/agreement_controller.dart';
import '../../core/constants/app_strings.dart';
import '../../core/widgets/custom_button.dart';
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
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: CustomTextField(
                controller: controller.agreementController,
                hint: AppStrings.agreementHint,
                maxLines: 20,
              ),
            ),
            const SizedBox(height: 20),
            CustomButton(
              text: AppStrings.analyze,
              onTap: controller.analyzeAgreement,
            ),
          ],
        ),
      ),
    );
  }
}
