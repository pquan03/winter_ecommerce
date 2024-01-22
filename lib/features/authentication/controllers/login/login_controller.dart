import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:winter_store/data/repositories/authentication/authentication_repository.dart';
import 'package:winter_store/features/personalization/controllers/user_controller.dart';
import 'package:winter_store/utils/constants/image_strings.dart';
import 'package:winter_store/utils/helpers/network_manager.dart';
import 'package:winter_store/utils/loaders/loaders.dart';
import 'package:winter_store/utils/popups/full_screen_loader.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  // Variables
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    email.text = localStorage.read('REMEMBER_ME_EMAIL') ?? '';
    password.text = localStorage.read('REMEMBER_ME_PASSWORD') ?? '';
    super.onInit();
  }

  Future<void> emailAndPasswordSignIn() async {
    try {
      // Start loading
      WFullScreenLoader.openLoadingDialog(
          'Logging you in...', TImages.docerAnimation);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        WFullScreenLoader.stopLoading();
        return;
      }

      if (!loginFormKey.currentState!.validate()) {
        WFullScreenLoader.stopLoading();
        return;
      }

      // Save data if remember is selected
      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }
      await AuthenticationRepository.instance
          .loginWithEmailAndPasswod(email.text.trim(), password.text.trim());

      // Remove Loader
      WFullScreenLoader.stopLoading();

      // Redirect
      AuthenticationRepository.instance.screenRedidrect();
    } catch (e) {
      WFullScreenLoader.stopLoading();
      WLoader.errorSnackBar(title: 'Oh snap!', message: e.toString());
    }
  }

  Future<void> googleSignIn() async {
    try {
      // Start loading
      WFullScreenLoader.openLoadingDialog(
          'Logging you in...', TImages.docerAnimation);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        WFullScreenLoader.stopLoading();
        return;
      }

      final userCredentials =
          await AuthenticationRepository.instance.signInWithGoole();

      await UserController.instance.saveUserRecord(userCredentials);

      // Remove loader
      WFullScreenLoader.stopLoading();

      // Redirect to main
      AuthenticationRepository.instance.screenRedidrect();
    } catch (e) {
      WLoader.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
