import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:winter_store/data/repositories/authentication/authentication_repository.dart';
import 'package:winter_store/data/repositories/user/user_repository.dart';
import 'package:winter_store/features/authentication/controllers/login/login_controller.dart';
import 'package:winter_store/features/authentication/screens/login/login.dart';
import 'package:winter_store/features/personalization/models/user_model.dart';
import 'package:winter_store/features/personalization/screens/profile/widgets/re_authenticate_user_form.dart';
import 'package:winter_store/utils/constants/image_strings.dart';
import 'package:winter_store/utils/constants/sizes.dart';
import 'package:winter_store/utils/helpers/network_manager.dart';
import 'package:winter_store/utils/loaders/loaders.dart';
import 'package:winter_store/utils/popups/full_screen_loader.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();
  final userRepository = Get.put(UserRepository());

  Rx<UserModel> user = UserModel.empty().obs;
  Rx<bool> profileLoading = false.obs;
  final GetStorage storage = GetStorage();

  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  Rx<bool> hidePassword = true.obs;
  GlobalKey<FormState> verifyFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  Future<void> fetchUserRecord() async {
    try {
      profileLoading(true);
      final user = await userRepository.fetchUserDetail();
      this.user.value = user;
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading(false);
    }
  }

  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
      await fetchUserRecord();

      if (userCredentials != null) {
        final nameParts =
            UserModel.nameParts(userCredentials.user?.displayName ?? '');
        final username =
            UserModel.generateUsername(userCredentials.user?.displayName ?? '');

        final newUser = UserModel(
            id: userCredentials.user!.uid,
            firstName: nameParts[0],
            lastName: nameParts[1],
            username: username,
            email: userCredentials.user!.email ?? '',
            phoneNumber: userCredentials.user!.phoneNumber ?? '',
            profilePicture: userCredentials.user!.photoURL ?? '');

        await userRepository.saveUserRecord(newUser);
      }
    } catch (e) {
      WLoader.waringSnackbar(
          title: 'Data not saved',
          message:
              'Something went wrong while saving your information. You can re-save your data in your Profile');
    }
  }

  void deleteAccountWarningPopup() {
    Get.defaultDialog(
        contentPadding: const EdgeInsets.all(TSizes.md),
        title: 'Delete Account',
        middleText: 'Are you sure you want to delete your account?',
        confirm: ElevatedButton(
            onPressed: () async => deleteUserAccount(),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: TSizes.lg),
              child: Text('Delete'),
            )),
        cancel: OutlinedButton(
            onPressed: () => Navigator.of(Get.overlayContext!).pop(),
            child: const Text('Cancel')));
  }

  Future<void> deleteUserAccount() async {
    try {
      // Start loading
      WFullScreenLoader.openLoadingDialog(
          'Proccessing', TImages.docerAnimation);

      // First re-authenticate user
      final auth = AuthenticationRepository.instance;
      final provider =
          auth.authUser!.providerData.map((e) => e.providerId).first;
      if (provider.isNotEmpty) {
        if (provider == 'google.com') {
          await auth.signInWithGoole();
          await auth.deleteAccount();
          WFullScreenLoader.stopLoading();
          Get.offAll(() => LoginController());
        } else {
          WFullScreenLoader.stopLoading();
          Get.to(() => ReAuthenticateUserFormScreen());
        }
      }
    } catch (e) {
      WFullScreenLoader.stopLoading();
      WLoader.errorSnackBar(title: 'Oh snap!', message: e.toString());
    }
  }

  Future<void> reAuthenticateEmailAndPasswordUser() async {
    try {
      // Start loading
      WFullScreenLoader.openLoadingDialog(
          'Proccessing', TImages.docerAnimation);

      // Check internet connection
      final isConnencted = await NetworkManager.instance.isConnected();
      if (!isConnencted) {
        WFullScreenLoader.stopLoading();
        return;
      }

      // Form validation
      if (!verifyFormKey.currentState!.validate()) {
        WFullScreenLoader.stopLoading();
        return;
      }

      // Re-authenticate user
      final auth = AuthenticationRepository.instance;
      await auth.loginWithEmailAndPasswod(
          verifyEmail.text, verifyPassword.text);

      // Delete account
      await AuthenticationRepository.instance
          .reAuthenticateWithEmailAndPasssord(
              verifyEmail.text.trim(), verifyPassword.text.trim());
      await AuthenticationRepository.instance.deleteAccount();

      // Stop loading
      WFullScreenLoader.stopLoading();

      // Delete user in store
      // check
      storage.remove('REMEMBER_ME_EMAIL');
      storage.remove('REMEMBER_ME_PASSWORD');

      // Show success snackbar
      WLoader.successSnackBar(
          title: 'Success', message: 'Your account has been deleted');

      Get.offAll(() => const LoginScreen());
    } catch (e) {
      WFullScreenLoader.stopLoading();
      WLoader.errorSnackBar(title: 'Oh snap!', message: e.toString());
    }
  }

  Future<void> uploadUserProfilePicture() async {
    try {
      final image = await ImagePicker().pickImage(
          source: ImageSource.gallery,
          imageQuality: 70,
          maxHeight: 512,
          maxWidth: 512);
      if (image == null) return;
      final imageUrl = await UserRepository.instance
          .uploadImage('Users/Images/Profile', image);

      Map<String, dynamic> json = {'profilePicture': imageUrl};
      await UserRepository.instance.updateSingleField(json);
      user.value.profilePicture = imageUrl;

      WLoader.successSnackBar(
          title: 'Success', message: 'Profile picture updated');
    } catch (e) {
      WLoader.errorSnackBar(title: 'Oh snap!', message: e.toString());
    }
  }
}
