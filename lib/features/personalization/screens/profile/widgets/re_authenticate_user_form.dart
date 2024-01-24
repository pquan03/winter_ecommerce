import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:winter_store/commons/widgets/appbar/appbar.dart';
import 'package:winter_store/features/personalization/controllers/user_controller.dart';
import 'package:winter_store/utils/constants/sizes.dart';
import 'package:winter_store/utils/constants/text_strings.dart';
import 'package:winter_store/utils/validators/validation.dart';

class ReAuthenticateUserFormScreen extends StatelessWidget {
  const ReAuthenticateUserFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: WAppBar(
        showBackArrow: true,
        title: const Text("Re-authenticate"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Form(
            key: controller.verifyFormKey,
            child: Column(children: [
              TextFormField(
                controller: controller.verifyEmail,
                validator: TValidator.validateEmail,
                decoration: const InputDecoration(
                  labelText: TTexts.email,
                  prefixIcon: Icon(Iconsax.direct_right),
                ),
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              Obx(
                () => TextFormField(
                  controller: controller.verifyPassword,
                  obscureText: controller.hidePassword.value,
                  validator: (value) =>
                      TValidator.validateEmptyText('Password', value),
                  decoration: InputDecoration(
                    labelText: TTexts.password,
                    prefixIcon: IconButton(
                      onPressed: () => controller.hidePassword.value =
                          !controller.hidePassword.value,
                      icon: Icon(controller.hidePassword.value
                          ? Iconsax.eye_slash
                          : Iconsax.eye),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () =>
                      controller.reAuthenticateEmailAndPasswordUser(),
                  child: const Text('Verify'),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
