import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/commons/widgets/appbar/appbar.dart';
import 'package:t_store/features/personalization/screens/address/add_new_address.dart';
import 'package:t_store/features/personalization/screens/address/widgets/single_adress.dart';
import 'package:t_store/utils/constants/sizes.dart';

class AddressesScreen extends StatelessWidget {
  const AddressesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // App Bar
      appBar: WAppBar(
        title: const Text('Addresses'),
        showBackArrow: true,
      ),

      // Bottom Button
      floatingActionButton: ElevatedButton(
          onPressed: () => Get.to(() => const AddNewAddressScreen()),
          child: const Icon(Iconsax.add)),

      // Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              SingleAddress(
                isSelected: true,
              ),
              SingleAddress(
                isSelected: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
