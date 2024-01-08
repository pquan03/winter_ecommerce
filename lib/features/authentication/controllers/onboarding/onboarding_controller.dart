import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:winter_store/features/authentication/screens/login/login.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

// Variables
  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;

  /// Update current Index when Page scroll
  void updatePageIndicator(index) => currentPageIndex.value = index;

  /// Jump to specific dot selected page.
  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.jumpToPage(index);
  }

// Update current index & jumpt to next page.
  void nextPage() {
    if (currentPageIndex.value == 2) {
      final storage = GetStorage();
      storage.write('isFirstTime', false);
      Get.offAll(() => const LoginScreen());
    } else {
      currentPageIndex.value = currentPageIndex.value + 1;
      pageController.jumpToPage(currentPageIndex.value);
    }
  }

// Update current index & jumpt to last page.
  void skipPage() {
    currentPageIndex.value = 2;
    pageController.jumpToPage(2);
  }
}
