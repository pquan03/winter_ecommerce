import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:winter_store/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:winter_store/utils/constants/colors.dart';
import 'package:winter_store/utils/constants/sizes.dart';
import 'package:winter_store/utils/device/device_utility.dart';
import 'package:winter_store/utils/helpers/helper_functions.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    final dark = THelperFunctions.isDarkMode(context);
    return Positioned(
      bottom: TDeviceUtils.getBottomNavigationBarHeight(),
      right: TSizes.defaultSpace,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: CircleBorder(),
              backgroundColor: dark ? TColors.primary : Colors.black),
          onPressed: controller.nextPage,
          child: const Icon(Iconsax.arrow_right_3)),
    );
  }
}
