import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:winter_store/features/authentication/screens/signup/verify_email.dart';
import 'package:winter_store/features/authentication/screens/signup/widget/term_conditions_checkbox.dart';
import 'package:winter_store/utils/constants/sizes.dart';
import 'package:winter_store/utils/constants/text_strings.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      children: [
        // First name and last name
        Row(
          children: [
            // First name
            Expanded(
              child: TextFormField(
                expands: false,
                decoration: const InputDecoration(
                    labelText: TTexts.firstName,
                    prefixIcon: Icon(Iconsax.user)),
              ),
            ),
            const SizedBox(
              width: TSizes.spaceBtwInputFields,
            ),
            // Last name
            Expanded(
              child: TextFormField(
                expands: false,
                decoration: const InputDecoration(
                    labelText: TTexts.lastName, prefixIcon: Icon(Iconsax.user)),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: TSizes.spaceBtwInputFields,
        ),
        // Username
        TextFormField(
          decoration: const InputDecoration(
              labelText: TTexts.username, prefixIcon: Icon(Iconsax.user_edit)),
        ),
        const SizedBox(
          height: TSizes.spaceBtwInputFields,
        ),
        // Email
        TextFormField(
          decoration: const InputDecoration(
              labelText: TTexts.email, prefixIcon: Icon(Iconsax.direct)),
        ),
        const SizedBox(
          height: TSizes.spaceBtwInputFields,
        ),
        // Phone number
        TextFormField(
          decoration: const InputDecoration(
              labelText: TTexts.phoneNo, prefixIcon: Icon(Iconsax.call)),
        ),
        // Password
        const SizedBox(
          height: TSizes.spaceBtwInputFields,
        ),
        TextFormField(
          obscureText: true,
          decoration: const InputDecoration(
              labelText: TTexts.password,
              prefixIcon: Icon(Iconsax.password_check),
              suffixIcon: Icon(Iconsax.eye_slash)),
        ),
        const SizedBox(
          height: TSizes.spaceBtwSections,
        ),
        // Terms and conditions and privacy
        TermConditionsCheckBox(),
        // Sign up button
        const SizedBox(
          height: TSizes.spaceBtwSections,
        ),
        SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () {
                  Get.to(() => const VerifyEmailScreen());
                },
                child: const Text(TTexts.createAccount)))
      ],
    ));
  }
}
