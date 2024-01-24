import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:winter_store/data/repositories/authentication/authentication_repository.dart';
import 'package:winter_store/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:winter_store/utils/constants/image_strings.dart';
import 'package:winter_store/utils/helpers/network_manager.dart';
import 'package:winter_store/utils/loaders/loaders.dart';
import 'package:winter_store/utils/popups/full_screen_loader.dart';

class ForgotPasswordController extends GetxController {
  // Singleton
  static ForgotPasswordController get instance => Get.find();

  // Variables
  final email = TextEditingController();
  GlobalKey<FormState> forgotPasswordFormKey = GlobalKey<FormState>();

  // Send password email
  sendPasswordResetEmail() async {
    try {
      // Start loading
      WFullScreenLoader.openLoadingDialog(
          'Proccessing you request...', TImages.docerAnimation);

      // Check internet connected
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        WFullScreenLoader.stopLoading();
        return;
      }

      // Check form validate
      if (!forgotPasswordFormKey.currentState!.validate()) {
        WFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance
          .sendPasswordResetEmail(email.text.trim());

      // Remove loading
      WFullScreenLoader.stopLoading();

      // Show success snackbar
      WLoader.successSnackBar(
          title: 'Email Sent!',
          message: 'Email link sent to reset your password'.tr);

      // Redirect to
      Get.to(() => ResetPasswordScreen(
            email: email.text.trim(),
          ));
    } catch (e) {
      WFullScreenLoader.stopLoading();
      WLoader.errorSnackBar(title: 'Oh snap!', message: e.toString());
    }
  }

  // Resend password email
  resendPasswordResetEmail() async {
    try {
      // Start loading
      WFullScreenLoader.openLoadingDialog(
          'Proccessing you request...', TImages.docerAnimation);

      // Check internet connected
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        WFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance
          .sendPasswordResetEmail(email.text.trim());

      // Remove loading
      WFullScreenLoader.stopLoading();

      // Show success snackbar
      WLoader.successSnackBar(
          title: 'Email Sent!',
          message: 'Email link sent to reset your password'.tr);
    } catch (e) {
      WFullScreenLoader.stopLoading();
      WLoader.errorSnackBar(title: 'Oh snap!', message: e.toString());
    }
  }
}
