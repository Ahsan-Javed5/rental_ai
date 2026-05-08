import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rental_ai/core/widgets/custom_loader.dart';
import '../../controllers/text_analysis_controller.dart';
import '../../core/constants/app_strings.dart';
import '../../core/widgets/custom_button.dart';
import '../../core/widgets/custom_textfield.dart';

class AskQuestionScreen extends StatelessWidget {
  const AskQuestionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TextAnalysisController());

    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.askQuestion),
      ),
      // Stack use kiya hai taakay loader content ke upar aaye
      body: Stack(
        children: [
          GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      AppStrings.askAnyThing,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    CustomTextField(
                      controller: controller.questionController,
                      hint: AppStrings.questionHint,
                      maxLines: 10,
                    ),
                    const SizedBox(height: 25),
                    CustomButton(
                      text: AppStrings.analyze,
                      onTap: controller.analyzeQuestion,
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Full Screen Overlay Loader
          Obx(
            () => controller.isLoading.value
                ? Container(
                    color: Colors.black.withOpacity(0.3), // Light blur effect
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
