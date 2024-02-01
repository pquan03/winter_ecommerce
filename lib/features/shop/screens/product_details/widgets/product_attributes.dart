import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:winter_store/commons/widgets/chips/choice_chip.dart';
import 'package:winter_store/commons/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:winter_store/commons/widgets/products/text/product_title_text.dart';
import 'package:winter_store/commons/widgets/texts/product_price_text.dart';
import 'package:winter_store/commons/widgets/texts/section_heading.dart';
import 'package:winter_store/features/shop/controllers/variation_controller.dart';
import 'package:winter_store/features/shop/models/product_model.dart';
import 'package:winter_store/utils/constants/colors.dart';
import 'package:winter_store/utils/constants/sizes.dart';
import 'package:winter_store/utils/helpers/helper_functions.dart';

class ProductAttributes extends StatelessWidget {
  const ProductAttributes({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = Get.put(VariationController());
    return Obx(
      () => Column(
        children: [
          // Selected attribute pricing and description
          if (controller.selectedVariation.value.id.isNotEmpty)
            RoundedContainer(
              padding: const EdgeInsets.all(TSizes.md),
              backgroundColor: dark ? TColors.darkerGrey : TColors.grey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                                if (controller
                                        .selectedVariation.value.salePrice! >
                                    0)
                                  Text(
                                    "\$${controller.selectedVariation.value.salePrice}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .apply(
                                            decoration:
                                                TextDecoration.lineThrough),
                                  ),
                                const SizedBox(
                                  width: TSizes.spaceBtwItems,
                                ),
                                // Sale price
                                if (controller.selectedVariation.value.price! >
                                    0)
                                  ProductPriceText(
                                    price:
                                        '${controller.selectedVariation.value.price}',
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
                                  controller.variationStockStatus.value,
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  // variation description
                  ProducTitleText(
                    title: controller.selectedVariation.value.description!,
                    maxLines: 4,
                    smallSize: true,
                  )
                ],
              ),
            ),
          if (controller.selectedVariation.value.id.isNotEmpty)
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
          // Attributes
          // Colors
          Column(
            children: product.productAttributes!
                .map((attribute) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SectionHeading(
                          title: attribute.name!,
                          showActionButton: false,
                        ),
                        const SizedBox(
                          height: TSizes.spaceBtwItems / 2,
                        ),
                        Obx(
                          () => Wrap(
                            spacing: 8,
                            children: attribute.values!.map((attributeValue) {
                              final isSelected = controller
                                      .selectedAttributes[attribute.name] ==
                                  attributeValue;
                              final isAvailable = controller
                                  .getAttributeAvailabilityInVariation(
                                      product.productVariations!,
                                      attribute.name!)
                                  .contains(attributeValue);
                              return WChoiceChip(
                                text: attributeValue,
                                selected: isSelected,
                                onSelected: isAvailable
                                    ? (selected) {
                                        if (selected && isAvailable) {
                                          controller.onAttributeSelected(
                                              product,
                                              attribute.name!,
                                              attributeValue);
                                        }
                                      }
                                    : null,
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ))
                .toList(),
          ),
          const SizedBox(
            height: TSizes.spaceBtwItems,
          ),
        ],
      ),
    );
  }
}
