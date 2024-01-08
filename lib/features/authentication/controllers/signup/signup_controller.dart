import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  static SignupController get to => Get.find();

  // Variables
  final email = TextEditingController();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final phoneNumber = TextEditingController();
  GlobalKey<FormState> signupFormkey = GlobalKey<FormState>();
  // Signup
  Future<void> signup() async {
    try {
      // Start loading

      // Check Internet Connectivity

      // Form Validation

      // Privacy Policy check

      //
    } catch (err) {
    } finally {}
  }
}
