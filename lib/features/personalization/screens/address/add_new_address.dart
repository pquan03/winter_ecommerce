import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:winter_store/commons/widgets/appbar/appbar.dart';
import 'package:winter_store/features/personalization/controllers/address_controller.dart';
import 'package:winter_store/utils/constants/sizes.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance;
    return Scaffold(
      // App bar
      appBar: WAppBar(
        title: const Text('Add new Address'),
        showBackArrow: true,
      ),
      // Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(children: [
            // Form
            Form(
                key: controller.addressFormKey,
                child: Column(
                  children: [
                    // Name
                    TextFormField(
                      controller: controller.name,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Iconsax.user), labelText: 'Name'),
                    ),

                    const SizedBox(
                      height: TSizes.spaceBtwInputFields,
                    ),

                    TextFormField(
                      controller: controller.phoneNum,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Iconsax.mobile),
                          labelText: 'Phone Number'),
                    ),

                    const SizedBox(
                      height: TSizes.spaceBtwInputFields,
                    ),

                    // Street & Postal Code
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: controller.street,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Iconsax.building_31),
                                labelText: 'Street'),
                          ),
                        ),
                        const SizedBox(
                          width: TSizes.spaceBtwInputFields,
                        ),
                        Expanded(
                          child: TextFormField(
                            controller: controller.postalCode,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Iconsax.code),
                                labelText: 'Postal Code'),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwInputFields,
                    ),

                    // City & State
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: controller.city,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Iconsax.building),
                                labelText: 'City'),
                          ),
                        ),
                        const SizedBox(
                          width: TSizes.spaceBtwInputFields,
                        ),
                        Expanded(
                          child: TextFormField(
                            controller: controller.state,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Iconsax.activity),
                                labelText: 'State'),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwInputFields,
                    ),

                    // Country
                    TextFormField(
                      controller: controller.country,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Iconsax.global),
                          labelText: 'Country'),
                    ),
                  ],
                )),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            // Save button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () => controller.addNewAddress(),
                  child: const Text('Save')),
            )
          ]),
        ),
      ),
    );
  }
}
