import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constants/app_routes.dart';
import '../../core/constants/app_strings.dart';
import '../../core/constants/app_colors.dart';
import '../../core/widgets/option_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.appName),
      ),
      drawer: Drawer(
        backgroundColor: AppColors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        child: Column(
          children: [
            // CUSTOM LUXURY HEADER
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(top: 60, bottom: 30),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF0F0F0F), AppColors.primary],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.only(topRight: Radius.circular(30)),
              ),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border:
                          Border.all(color: const Color(0xFFD4AF37), width: 2),
                    ),
                    child: const CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.gavel_rounded,
                        size: 45,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    AppStrings.appName,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    height: 2,
                    width: 40,
                    color: const Color(0xFFD4AF37), // Subtle gold line
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // DRAWER ITEMS
            _buildDrawerItem(
              icon: Icons.question_answer_rounded,
              title: AppStrings.askQuestion,
              onTap: () {
                Get.back();
                Get.toNamed(AppRoutes.askQuestion);
              },
            ),
            _buildDrawerItem(
              icon: Icons.description_rounded,
              title: AppStrings.pasteAgreement,
              onTap: () {
                Get.back();
                Get.toNamed(AppRoutes.agreement);
              },
            ),
            _buildDrawerItem(
              icon: Icons.picture_as_pdf_rounded,
              title: AppStrings.uploadPdf,
              onTap: () {
                Get.back();
                Get.toNamed(AppRoutes.pdf);
              },
            ),
            const Divider(indent: 20, endIndent: 20, color: Colors.black12),
            _buildDrawerItem(
              icon: Icons.info_outline_rounded,
              title: AppStrings.aboutMe,
              onTap: () {
                Get.back();
                Get.toNamed(AppRoutes.about);
              },
            ),

            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                "Version 1.0.0",
                style: TextStyle(
                    color: AppColors.textLight.withOpacity(0.5), fontSize: 12),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            const Text(
              AppStrings.welcome,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: AppColors.textDark,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              AppStrings.homepageDescription,
              style: TextStyle(
                fontSize: 17,
                color: AppColors.textLight,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 50),
            OptionCard(
              title: AppStrings.askQuestion,
              icon: Icons.question_answer_rounded,
              onTap: () {
                Get.toNamed(AppRoutes.askQuestion);
              },
            ),
            const SizedBox(height: 18),
            OptionCard(
              title: AppStrings.pasteAgreement,
              icon: Icons.description_rounded,
              onTap: () {
                Get.toNamed(AppRoutes.agreement);
              },
            ),
            const SizedBox(height: 18),
            OptionCard(
              title: AppStrings.uploadPdf,
              icon: Icons.picture_as_pdf_rounded,
              onTap: () {
                Get.toNamed(AppRoutes.pdf);
              },
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildDrawerItem(
    {required IconData icon,
    required String title,
    required VoidCallback onTap}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
    child: ListTile(
      leading: Icon(icon, color: AppColors.primary, size: 24),
      title: Text(
        title,
        style: const TextStyle(
          color: AppColors.textDark,
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
      ),
      trailing: const Icon(Icons.arrow_forward_ios_rounded,
          size: 14, color: Colors.black26),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      onTap: onTap,
      hoverColor: AppColors.primary.withOpacity(0.05),
    ),
  );
}
