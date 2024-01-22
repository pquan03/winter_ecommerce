import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:winter_store/features/authentication/controllers/login/login_controller.dart';
import 'package:winter_store/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:winter_store/features/authentication/screens/signup/sign_up.dart';
import 'package:winter_store/utils/constants/sizes.dart';
import 'package:winter_store/utils/constants/text_strings.dart';
import 'package:winter_store/utils/validators/validation.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
        key: controller.loginFormKey,
        child: Padding(
          padding:
              const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
          child: Column(
            children: [
              // Email
              TextFormField(
                controller: controller.email,
                validator: (value) => TValidator.validateEmail(value),
                decoration: InputDecoration(
                  prefixIcon: Icon(Iconsax.direct_right),
                  labelText: TTexts.email,
                ),
              ),
              const SizedBox(
                height: TSizes.spaceBtwInputFields,
              ),
              // Password
              Obx(
                () => TextFormField(
                  controller: controller.password,
                  validator: (value) => TValidator.validatePassword(value),
                  obscureText: controller.hidePassword.value,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Iconsax.password_check),
                    labelText: TTexts.password,
                    suffixIcon: IconButton(
                        onPressed: () {
                          controller.hidePassword.value =
                              !controller.hidePassword.value;
                        },
                        icon: Icon(controller.hidePassword.value
                            ? Iconsax.eye
                            : Iconsax.eye_slash)),
                  ),
                ),
              ),
              const SizedBox(
                height: TSizes.spaceBtwInputFields / 2,
              ),
              // Remember me & forget password
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Remember me
                  Row(
                    children: [
                      Obx(
                        () => Checkbox(
                          value: controller.rememberMe.value,
                          onChanged: (value) {
                            controller.rememberMe.value =
                                !controller.rememberMe.value;
                          },
                        ),
                      ),
                      Text(TTexts.rememberMe),
                    ],
                  ),
                  // Forget password
                  TextButton(
                      onPressed: () =>
                          Get.to(() => const ForgetPasswordScreen()),
                      child: Text(TTexts.forgetPassword))
                ],
              ),
              // Sign in button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => controller.emailAndPasswordSignIn(),
                    child: const Text(TTexts.signIn)),
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              // create account button
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                    onPressed: () => Get.off(() => const SignUpScreen()),
                    child: const Text(TTexts.createAccount)),
              )
            ],
          ),
        ));
  }
}
