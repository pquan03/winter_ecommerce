import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:iconsax/iconsax.dart';
import 'package:winter_store/commons/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:winter_store/features/personalization/controllers/address_controller.dart';
import 'package:winter_store/features/personalization/models/address_model.dart';
import 'package:winter_store/utils/constants/colors.dart';
import 'package:winter_store/utils/constants/sizes.dart';
import 'package:winter_store/utils/helpers/helper_functions.dart';

class SingleAddress extends StatelessWidget {
  const SingleAddress({super.key, required this.onTap, required this.address});

  final AddressModel address;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance;
    return Obx(() {
      final defaultAddressId = controller.defaultAddress.value.id;
      return InkWell(
        onTap: onTap,
        child: RoundedContainer(
          width: double.infinity,
          showBorder: true,
          backgroundColor: defaultAddressId == address.id
              ? TColors.primary.withOpacity(0.5)
              : null,
          borderColor: defaultAddressId == address.id
              ? Colors.transparent
              : THelperFunctions.isDarkMode(context)
                  ? TColors.darkerGrey
                  : TColors.grey,
          child: Padding(
            padding: const EdgeInsets.all(TSizes.md),
            child: Stack(
              children: [
                Positioned(
                    top: 0,
                    right: 5,
                    child: Icon(
                      defaultAddressId == address.id
                          ? Iconsax.tick_circle5
                          : null,
                      color: THelperFunctions.isDarkMode(context)
                          ? TColors.light
                          : TColors.dark,
                    )),
                Column(
                  children: [
                    // individual
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              address.name,
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            Text(
                              address.phoneNumber,
                              style: Theme.of(context).textTheme.bodyLarge,
                            )
                          ],
                        ),
                      ],
                    ),

                    Text(
                      '${address.street}, ${address.city}, ${address.state}, ${address.postalCode}, ${address.country}',
                      style: Theme.of(context).textTheme.bodyLarge,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
