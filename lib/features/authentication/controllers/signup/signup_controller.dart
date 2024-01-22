import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:winter_store/data/repositories/authentication/authentication_repository.dart';
import 'package:winter_store/data/repositories/user/user_repository.dart';
import 'package:winter_store/features/authentication/screens/signup/verify_email.dart';
import 'package:winter_store/features/personalization/models/user_model.dart';
import 'package:winter_store/utils/constants/image_strings.dart';
import 'package:winter_store/utils/helpers/network_manager.dart';
import 'package:winter_store/utils/loaders/loaders.dart';
import 'package:winter_store/utils/popups/full_screen_loader.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  // Variables
  final Rx<bool> hidePassword = true.obs;
  final Rx<bool> privacyPolicy = true.obs;
  final email = TextEditingController();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final phoneNumber = TextEditingController();
  GlobalKey<FormState> signupFormkey = GlobalKey<FormState>();
  // Signup
  void signup() async {
    try {
      // Start loading
      WFullScreenLoader.openLoadingDialog(
          'We are proccessing you information...', TImages.darkAppLogo);
      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        return;
      }
      // Form Validation
      if (!signupFormkey.currentState!.validate()) {
        return;
      }

      // Privacy Policy check
      if (!privacyPolicy.value) {
        WLoader.waringSnackbar(
            title: 'Accept Privacy Policy',
            message:
                'In order to create account, you must have to read and accept the Privacy Policy & Terms of Use.');
        return;
      }
      //Register user in Firebase Authentication & Save user data in Firebase
      final user = await AuthenticationRepository.instance
          .registerWithEmailAdPassword(email.text, password.text);
      //  Saved Authenticated user data in Firebase
      final newUser = UserModel(
        id: user.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        username: username.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '',
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      // Show Success Message
      WLoader.successSnackBar(
          title: 'Success',
          message:
              'Your account has been created! verify your email address to login');

      // Move to Verify Email Screen
      Get.to(VerifyEmailScreen(
        email: email.text.trim(),
      ));
    } catch (e) {
      WLoader.errorSnackBar(title: 'Oh snap!', message: e.toString());
    } finally {
      WFullScreenLoader.stopLoading();
    }
  }
}
