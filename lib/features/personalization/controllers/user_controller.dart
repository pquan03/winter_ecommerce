import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:winter_store/data/repositories/user/user_repository.dart';
import 'package:winter_store/features/personalization/models/user_model.dart';
import 'package:winter_store/utils/loaders/loaders.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
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

        await UserRepository.instance.saveUserRecord(newUser);
      }
    } catch (e) {
      WLoader.waringSnackbar(
          title: 'Data not saved',
          message:
              'Something went wrong while saving your information. You can re-save your data in your Profile');
    }
  }
}
