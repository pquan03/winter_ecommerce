import 'package:flutter/material.dart';
import 'package:winter_store/commons/widgets/chips/choice_chip.dart';
import 'package:winter_store/commons/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:winter_store/commons/widgets/products/text/product_title_text.dart';
import 'package:winter_store/commons/widgets/texts/product_price_text.dart';
import 'package:winter_store/commons/widgets/texts/section_heading.dart';
import 'package:winter_store/utils/constants/colors.dart';
import 'package:winter_store/utils/constants/sizes.dart';
import 'package:winter_store/utils/helpers/helper_functions.dart';

class ProductAttributes extends StatelessWidget {
  const ProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        // Selected attribute pricing and description
        RoundedContainer(
          padding: const EdgeInsets.all(TSizes.md),
          backgroundColor: dark ? TColors.darkerGrey : TColors.grey,
          child: Column(
            children: [
              // Title, Price and Stock status
              Row(
                children: [
                  const SectionHeading(
                    title: "Variation",
                    showActionButton: false,
                  ),
                  const SizedBox(
                    width: TSizes.spaceBtwItems,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        // Title & Price
                        Row(
                          children: [
                            const ProducTitleText(
                              title: "Price : ",
                              smallSize: true,
                            ),
                            const SizedBox(
                              width: TSizes.spaceBtwItems,
                            ),
                            // Actual price
                            Text(
                              "\$25",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .apply(
                                      decoration: TextDecoration.lineThrough),
                            ),
                            const SizedBox(
                              width: TSizes.spaceBtwItems,
                            ),
                            // Sale price
                            ProductPriceText(
                              price: '20',
                              isLarge: false,
                            ),
                          ],
                        ),
                        // Stock
                        Row(
                          children: [
                            const ProducTitleText(
                              title: 'Stock: ',
                              smallSize: true,
                            ),
                            const SizedBox(
                              width: TSizes.spaceBtwItems,
                            ),
                            Text(
                              'In Stock',
                              style: Theme.of(context).textTheme.titleMedium,
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
              // variation description
              const ProducTitleText(
                title:
                    'This is the Description of the Product and it can go up to max 4 lines',
                maxLines: 4,
                smallSize: true,
              )
            ],
          ),
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        // Attributes
        // Colors
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionHeading(
              title: 'Colors',
              showActionButton: false,
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems / 2,
            ),
            Wrap(
              spacing: 8,
              children: [
                WChoiceChip(
                  text: 'Green',
                  selected: true,
                  onSelected: (valie) {},
                ),
                WChoiceChip(
                  text: 'Blue',
                  selected: false,
                  onSelected: (value) {},
                ),
                WChoiceChip(
                  text: 'Yellow',
                  selected: false,
                  onSelected: (value) {},
                ),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionHeading(
              title: 'Size',
              showActionButton: false,
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems / 2,
            ),
            Wrap(
              spacing: 8,
              children: [
                WChoiceChip(
                  text: 'EU 34',
                  selected: true,
                  onSelected: (value) {},
                ),
                WChoiceChip(
                    text: 'EU 36', selected: false, onSelected: (value) {}),
                WChoiceChip(
                    text: 'EU 38', selected: false, onSelected: (value) {}),
              ],
            ),
          ],
        )
      ],
    );
  }
}
