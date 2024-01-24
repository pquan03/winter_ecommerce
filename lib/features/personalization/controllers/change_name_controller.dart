import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:winter_store/data/repositories/user/user_repository.dart';
import 'package:winter_store/features/personalization/controllers/user_controller.dart';
import 'package:winter_store/features/personalization/screens/profile/profile.dart';
import 'package:winter_store/utils/constants/image_strings.dart';
import 'package:winter_store/utils/helpers/network_manager.dart';
import 'package:winter_store/utils/loaders/loaders.dart';
import 'package:winter_store/utils/popups/full_screen_loader.dart';

class ChangeNameController extends GetxController {
  // Singleton
  static ChangeNameController get instance => Get.find();

  // Variables
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userRepository = Get.put(UserRepository());
  final userController = UserController.instance;
  GlobalKey<FormState> changeNameFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    getInitializeName();
  }

  Future<void> getInitializeName() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  Future<void> updateNameUser() async {
    try {
      // Start loading
      WFullScreenLoader.openLoadingDialog(
          'We are updating your information...', TImages.docerAnimation);

      // Check internet connection
      final isConnencted = await NetworkManager.instance.isConnected();
      if (!isConnencted) {
        WFullScreenLoader.stopLoading();
        return;
      }

      // Form validation
      if (!changeNameFormKey.currentState!.validate()) {
        WFullScreenLoader.stopLoading();
        return;
      }

      Map<String, dynamic> name = {
        'firstName': firstName.text,
        'lastName': lastName.text
      };

      await userRepository.updateSingleField(name);

      // Update variable
      userController.user.value.firstName = firstName.text;
      userController.user.value.lastName = lastName.text;

      // Stop loading
      WFullScreenLoader.stopLoading();

      // Show success snackbar
      WLoader.successSnackBar(
          title: 'Success', message: 'Your name has been updated successfully');

      Get.off(() => const ProfileScreen());
    } catch (e) {
      WFullScreenLoader.stopLoading();
      WLoader.errorSnackBar(title: 'Oh snap!', message: e.toString());
    }
  }
}
