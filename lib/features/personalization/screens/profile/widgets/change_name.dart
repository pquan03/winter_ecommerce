import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:winter_store/commons/widgets/appbar/appbar.dart';
import 'package:winter_store/features/personalization/controllers/change_name_controller.dart';
import 'package:winter_store/utils/constants/sizes.dart';
import 'package:winter_store/utils/constants/text_strings.dart';
import 'package:winter_store/utils/validators/validation.dart';

class ChangeNameScreen extends StatelessWidget {
  const ChangeNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ChangeNameController());
    return Scaffold(
      appBar: WAppBar(
        showBackArrow: true,
        title: const Text("Change Name"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Heading
              Text(
                  'Use real name to easy verification. This name will be visible to other users.',
                  style: Theme.of(context).textTheme.labelMedium),

              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              // Form
              Form(
                  key: controller.changeNameFormKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: controller.firstName,
                        validator: (value) =>
                            TValidator.validateEmptyText('First Name', value),
                        expands: false,
                        decoration: const InputDecoration(
                            labelText: TTexts.firstName,
                            prefixIcon: Icon(Iconsax.user)),
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwItems,
                      ),
                      TextFormField(
                        controller: controller.lastName,
                        validator: (value) =>
                            TValidator.validateEmptyText('Last Name', value),
                        expands: false,
                        decoration: const InputDecoration(
                            labelText: TTexts.lastName,
                            prefixIcon: Icon(Iconsax.user)),
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwSections,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () => controller.updateNameUser(),
                          child: const Text('Save'),
                        ),
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
