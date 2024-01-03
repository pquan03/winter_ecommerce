import 'package:flutter/material.dart';
import 'package:t_store/commons/widgets/texts/section_heading.dart';
import 'package:t_store/utils/constants/sizes.dart';

class WShippingAddressSection extends StatelessWidget {
  const WShippingAddressSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionHeading(
          title: 'Shipping Address',
          buttonTitle: 'Change',
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Coding with Winter',
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
                  '+84-867-333-697',
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
                  '84 Tan Trieu, Thanh Tri district, Ha Noi Capital, VN',
                  style: Theme.of(context).textTheme.bodyMedium,
                ))
              ],
            ),
          ],
        )
      ],
    );
  }
}