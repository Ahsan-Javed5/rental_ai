import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/pdf_controller.dart';
import '../../core/constants/app_colors.dart';
import '../../core/widgets/custom_button.dart';

class PdfScreen extends StatelessWidget {
  const PdfScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PdfController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload PDF'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(22),
              ),
              child: Column(
                children: [
                  const Icon(
                    Icons.picture_as_pdf,
                    size: 70,
                    color: AppColors.primary,
                  ),
                  const SizedBox(height: 15),
                  Obx(
                    () => Text(
                      controller.fileName.value,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),
            CustomButton(
              text: 'Choose PDF',
              onTap: controller.pickPdf,
            ),
            const SizedBox(height: 15),
            CustomButton(
              text: 'Analyze PDF',
              onTap: controller.analyzePdf,
            ),
          ],
        ),
      ),
    );
  }
}
