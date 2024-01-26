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

  // ---  Form
  final email = TextEditingController();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final Rx<bool> hidePassword = true.obs;
  final phoneNumber = TextEditingController();
  final Rx<bool> privacyPolicy = false.obs;
  GlobalKey<FormState> signupFormkey = GlobalKey<FormState>();


  // Signup
  void signup() async {
    try {
      // Start loading
      WFullScreenLoader.openLoadingDialog(
          'We are proccessing you information...', TImages.docerAnimation);
      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        WFullScreenLoader.stopLoading();
        return;
      }
      // Form Validation
      if (!signupFormkey.currentState!.validate()) {
        WFullScreenLoader.stopLoading();
        return;
      }

      // Privacy Policy check
      if (!privacyPolicy.value) {
        WFullScreenLoader.stopLoading();
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
        profilePicture:
            'https://as1.ftcdn.net/v2/jpg/03/46/83/96/1000_F_346839683_6nAPzbhpSkIpb8pmAwufkC7c5eD7wYws.jpg',
      );

      // Save user data in Firestore
      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      // Show Success Message
      WLoader.successSnackBar(
          title: 'Success',
          message:
              'Your account has been created! verify your email address to login');

      // Remove loading
      WFullScreenLoader.stopLoading();

      // Move to Verify Email Screen
      Get.to(() => VerifyEmailScreen(
            email: email.text.trim(),
          ));
    } catch (e) {
      WFullScreenLoader.stopLoading();
      WLoader.errorSnackBar(title: 'Oh snap!', message: e.toString());
    }
  }
}
