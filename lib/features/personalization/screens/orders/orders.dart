import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/commons/widgets/appbar/appbar.dart';
import 'package:t_store/commons/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // App bar
      appBar: WAppBar(
        title: const Text('My Orders'),
        showBackArrow: true,
      ),
      // Body
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ListView.separated(
          itemCount: 10,
          separatorBuilder: (_, __) => const SizedBox(
            height: TSizes.spaceBtwItems,
          ),
          itemBuilder: (_, index) {
            return RoundedContainer(
              showBorder: true,
              backgroundColor: THelperFunctions.isDarkMode(context)
                  ? TColors.dark
                  : TColors.light,
              padding: const EdgeInsets.all(TSizes.md),
              child: Column(
                children: [
                  // Order State - Row 1
                  Row(
                    children: [
                      Icon(Iconsax.ship),
                      const SizedBox(
                        width: TSizes.spaceBtwItems / 2,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Processing',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .apply(
                                      color: TColors.primary,
                                      fontWeightDelta: 1),
                            ),
                            Text(
                              '05 Jav 2024',
                              style: Theme.of(context).textTheme.headlineSmall,
                            )
                          ],
                        ),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Iconsax.arrow_right_34,
                            size: TSizes.iconSm,
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),

                  // Order code & Shipping date - Row 2
                  Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Icon(Iconsax.ship),
                            const SizedBox(
                              width: TSizes.spaceBtwItems / 2,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Order',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium),
                                  Text(
                                    'WTG0712',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: TSizes.spaceBtwItems,
                      ),
                      // Shipping date
                      Expanded(
                        child: Row(
                          children: [
                            Icon(Iconsax.ship),
                            const SizedBox(
                              width: TSizes.spaceBtwItems / 2,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Shipping Date',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium),
                                  Text(
                                    '07 Jav 2024',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
