import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:winter_store/utils/constants/colors.dart';
import 'package:winter_store/utils/helpers/helper_functions.dart';

class WFullScreenLoader {
  static void openLoadingDialog(String text, String animation) {
    showDialog(
        context: Get.overlayContext!,
        barrierDismissible: false,
        builder: (_) => PopScope(
              canPop: false,
              child: Container(
                color: THelperFunctions.isDarkMode(Get.context!)
                    ? TColors.dark
                    : TColors.white,
                width: double.infinity,
                height: double.infinity,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 250,
                    ),
                  ],
                ),
              ),
            ));
  }
}
