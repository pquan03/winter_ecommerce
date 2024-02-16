import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:winter_store/commons/widgets/texts/section_heading.dart';
import 'package:winter_store/features/personalization/controllers/address_controller.dart';

import 'package:winter_store/utils/constants/sizes.dart';

class WShippingAddressSection extends StatelessWidget {
  const WShippingAddressSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final addressController = AddressController.instance;
    return Column(
      children: [
        SectionHeading(
          title: 'Shipping Address',
          buttonTitle: 'Change',
          showActionButton: false,
        ),
        Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                addressController.defaultAddress.value.name,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems / 2,
              ),
              Row(
                children: [
                  const Icon(Icons.phone),
                  const SizedBox(
                    width: TSizes.spaceBtwItems,
                  ),
                  Expanded(
                      child: Text(
                    addressController.defaultAddress.value.phoneNumber,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ))
                ],
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems / 2,
              ),
              Row(
                children: [
                  const Icon(Icons.location_history),
                  const SizedBox(
                    width: TSizes.spaceBtwItems,
                  ),
                  Expanded(
                      child: Text(
                    AddressController.instance.getAddressDefaultDetail(),
                    style: Theme.of(context).textTheme.bodyMedium,
                  ))
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
