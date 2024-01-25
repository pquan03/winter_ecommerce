import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:winter_store/commons/widgets/success_screen/success_screen.dart';
import 'package:winter_store/data/repositories/authentication/authentication_repository.dart';
import 'package:winter_store/utils/constants/image_strings.dart';
import 'package:winter_store/utils/constants/text_strings.dart';
import 'package:winter_store/utils/loaders/loaders.dart';

class VerifyEmailController extends GetxController {
  // Singleton
  static VerifyEmailController get instance => Get.find();

  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

  sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      WLoader.successSnackBar(
          title: 'Email sent!',
          message:
              'Please check your email and verify your account to continue.');
    } catch (e) {
      WLoader.errorSnackBar(title: 'Oh snap!', message: e.toString());
    }
  }

  setTimerForAutoRedirect() {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser!.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user?.emailVerified ?? false) {
        timer.cancel();
        Get.off(() => SuccessScreen(
            image: TImages.staticSuccessIllustration,
            title: TTexts.yourAccountCreatedTitle,
            subtitle: TTexts.yourAccountCreatedSubTitle,
            onPressed: () =>
                AuthenticationRepository.instance.screenRedidrect()));
      }
    });
  }

  checkEmailVerificationStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
      Get.off(() => SuccessScreen(
          image: TImages.staticSuccessIllustration,
          title: TTexts.yourAccountCreatedTitle,
          subtitle: TTexts.yourAccountCreatedSubTitle,
          onPressed: () =>
              AuthenticationRepository.instance.screenRedidrect()));
    }
  }
}
