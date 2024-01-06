import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:winter_store/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:winter_store/features/authentication/screens/signup/sign_up.dart';
import 'package:winter_store/navigation_menu.dart';
import 'package:winter_store/utils/constants/sizes.dart';
import 'package:winter_store/utils/constants/text_strings.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Padding(
      padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
      child: Column(
        children: [
          // Email
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: Icon(Iconsax.direct_right),
              labelText: TTexts.email,
            ),
          ),
          const SizedBox(
            height: TSizes.spaceBtwInputFields,
          ),
          // Password
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: Icon(Iconsax.password_check),
              labelText: TTexts.password,
              suffixIcon: Icon(Iconsax.eye_slash),
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
                  Checkbox(
                    value: true,
                    onChanged: (value) {},
                  ),
                  Text(TTexts.rememberMe),
                ],
              ),
              // Forget password
              TextButton(
                  onPressed: () => Get.to(() => const ForgetPasswordScreen()),
                  child: Text(TTexts.forgetPassword))
            ],
          ),
          // Sign in button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () {
                  Get.to(() => const NavigationMenu());
                },
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
