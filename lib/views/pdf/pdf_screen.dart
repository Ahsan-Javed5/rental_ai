import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rental_ai/core/constants/app_strings.dart';
import 'package:rental_ai/core/widgets/custom_loader.dart';
import '../../controllers/pdf_controller.dart';
import '../../core/constants/app_colors.dart';
import '../../core/widgets/custom_button.dart';
import '../../core/widgets/custom_snack_bar.dart';

class PdfScreen extends StatelessWidget {
  const PdfScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PdfController());

    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.uploadPdf),
      ),
      body: Stack(
        children: [
          Padding(
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
                  text: AppStrings.choosePdf,
                  onTap: controller.pickPdf,
                ),
                const SizedBox(height: 15),
                CustomButton(
                  text: AppStrings.analyzePdf,
                  onTap: () {
                    if (controller.fileName.value ==
                        AppStrings.noFileSelected) {
                      CustomSnackBar.show(
                        title: AppStrings.fileMissing,
                        message: AppStrings.selectPdfFirst,
                      );
                    } else {
                      controller.analyzePdf();
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
