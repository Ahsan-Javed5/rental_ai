import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rental_ai/views/splash/splash_screen.dart';

import 'core/constants/app_routes.dart';
import 'core/theme/app_theme.dart';
import 'views/about/about_screen.dart';
import 'views/agreement/agreement_screen.dart';
import 'views/ask_question/ask_question_screen.dart';
import 'views/home/home_screen.dart';
import 'views/pdf/pdf_screen.dart';
import 'views/result/result_screen.dart';

void main() {
  runApp(const RentalAIApp());
}

class RentalAIApp extends StatelessWidget {
  const RentalAIApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rental AI',
      theme: AppTheme.lightTheme,
      initialRoute: AppRoutes.splash,
      getPages: [
        GetPage(name: AppRoutes.splash, page: () => const LuxurySplashScreen()),
        GetPage(name: AppRoutes.home, page: () => const HomeScreen()),
        GetPage(
            name: AppRoutes.askQuestion, page: () => const AskQuestionScreen()),
        GetPage(name: AppRoutes.agreement, page: () => const AgreementScreen()),
        GetPage(name: AppRoutes.pdf, page: () => const PdfScreen()),
        GetPage(name: AppRoutes.result, page: () => const ResultScreen()),
        GetPage(name: AppRoutes.about, page: () => const AboutScreen()),
      ],
    );
  }
}
