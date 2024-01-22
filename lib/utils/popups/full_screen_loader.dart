import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:winter_store/utils/constants/colors.dart';
import 'package:winter_store/utils/constants/sizes.dart';
import 'package:winter_store/utils/helpers/helper_functions.dart';

class WFullScreenLoader {
  static void openLoadingDialog(String text, String animation) {
    final dark = THelperFunctions.isDarkMode(Get.context!);
    showDialog(
        context: Get.overlayContext!,
        useSafeArea: false,
        barrierDismissible: false,
        builder: (_) => WillPopScope(
              onWillPop: () async => false,
              child: Container(
                color: dark ? TColors.dark : TColors.white,
                width: double.infinity,
                height: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 250,
                      child: Lottie.asset(animation),
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwSections,
                    ),
                    Text(
                      text,
                      style: Theme.of(Get.context!).textTheme.titleMedium,
                    )
                  ],
                ),
              ),
            ));
  }

  static stopLoading() {
    Navigator.of(Get.overlayContext!).pop();
  }
}
