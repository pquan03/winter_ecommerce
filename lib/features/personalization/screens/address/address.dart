import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:winter_store/commons/widgets/appbar/appbar.dart';
import 'package:winter_store/features/personalization/controllers/address_controller.dart';
import 'package:winter_store/features/personalization/screens/address/add_new_address.dart';
import 'package:winter_store/features/personalization/screens/address/widgets/single_adress.dart';
import 'package:winter_store/utils/constants/sizes.dart';
import 'package:winter_store/utils/helpers/network_help_functions.dart';

class AddressesScreen extends StatelessWidget {
  const AddressesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddressController());
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
          child: Obx(
            () => FutureBuilder(
              // When change key value, it will trigger refresh because wrapped with Obx
                key: Key(controller.isRefreshData.value.toString()),
                future: controller.getAllUserAddress(),
                builder: (_, snapshot) {
                  final widget = NetworkHelpFunctions.checkMultuRecordState(
                      snapshot: snapshot);
                  if (widget != null) {
                    return widget;
                  }

                  final addresses = snapshot.data!;

                  return ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    separatorBuilder: (_, __) => const SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),
                    itemCount: addresses.length,
                    itemBuilder: (_, index) {
                      final address = addresses[index];
                      return SingleAddress(
                        onTap: () => controller.setDefaultAddress(address),
                        address: address,
                      );
                    },
                  );
                }),
          ),
        ),
      ),
    );
  }
}
