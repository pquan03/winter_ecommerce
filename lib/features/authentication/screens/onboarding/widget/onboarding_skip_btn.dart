import 'package:flutter/material.dart';
import 'package:winter_store/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:winter_store/utils/constants/sizes.dart';
import 'package:winter_store/utils/device/device_utility.dart';

class OnBoardingSkipBTN extends StatelessWidget {
  const OnBoardingSkipBTN({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    return Positioned(
      top: TDeviceUtils.getAppBarHeight(),
      right: TSizes.defaultSpace,
      child:
          TextButton(onPressed: controller.skipPage, child: const Text('Skip')),
    );
  }
}
