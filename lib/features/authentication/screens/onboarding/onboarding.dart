import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:t_store/features/authentication/screens/onboarding/widget/onboarding_dot_navigation.dart';
import 'package:t_store/features/authentication/screens/onboarding/widget/onboarding_next_button.dart';
import 'package:t_store/features/authentication/screens/onboarding/widget/onboarding_page.dart';
import 'package:t_store/features/authentication/screens/onboarding/widget/onboarding_skip_btn.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/text_strings.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPage(
                image: TImages.onBoardingImage1,
                title: TTexts.onBoardingTitle1,
                subTitlte: TTexts.onBoardingSubTitle1,
              ),
              OnBoardingPage(
                image: TImages.onBoardingImage2,
                title: TTexts.onBoardingTitle2,
                subTitlte: TTexts.onBoardingSubTitle2,
              ),
              OnBoardingPage(
                image: TImages.onBoardingImage3,
                title: TTexts.onBoardingTitle3,
                subTitlte: TTexts.onBoardingSubTitle3,
              ),
            ],
          ),
          // Skip Button
          const OnBoardingSkipBTN(),
          // Dot Navigation SmoothPageIndicator
          const OnBoardingDotNavigation(),
          // Circular Button
          const OnBoardingNextButton()
        ],
      ),
    );
  }
}
