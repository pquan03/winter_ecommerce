import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:winter_store/commons/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:winter_store/commons/widgets/custom_shapes/icons/circular_icon.dart';
import 'package:winter_store/commons/widgets/images/rounded_image.dart';
import 'package:winter_store/commons/widgets/products/cart/add_card_button.dart';
import 'package:winter_store/commons/widgets/products/product_cards/brand_title_with_verified_icon.dart';
import 'package:winter_store/commons/widgets/products/text/product_title_text.dart';
import 'package:winter_store/commons/widgets/texts/product_price_text.dart';
import 'package:winter_store/utils/constants/colors.dart';
import 'package:winter_store/utils/constants/image_strings.dart';
import 'package:winter_store/utils/constants/sizes.dart';
import 'package:winter_store/utils/helpers/helper_functions.dart';

class ProductCardHorizontal extends StatelessWidget {
  const ProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      width: 310,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: dark ? TColors.darkerGrey : TColors.lightContainer),
      child: Row(
        children: [
          //  Thumbnail
          RoundedContainer(
            height: 120,
            padding: const EdgeInsets.all(TSizes.sm),
            backgroundColor: dark ? TColors.dark : TColors.white,
            child: Stack(
              children: [
                // Thumbnail Image
                SizedBox(
                  width: 120,
                  height: 120,
                  child: RoundedImage(
                    imageUrl: TImages.productImage1,
                    applyImageRadius: true,
                  ),
                ),
                // Sale tag
                Positioned(
                  top: 12,
                  child: RoundedContainer(
                    radius: TSizes.sm,
                    backgroundColor: TColors.secondary.withOpacity(.8),
                    padding: const EdgeInsets.symmetric(
                        horizontal: TSizes.sm, vertical: TSizes.xs),
                    child: Text(
                      "25%",
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .apply(color: Colors.black),
                    ),
                  ),
                ),
                // Favorite button
                Positioned(
                  right: 0,
                  top: 0,
                  child: CircularIcon(
                    icon: Iconsax.heart5,
                    color: Colors.red,
                  ),
                )
              ],
            ),
          ),
          // Details
          SizedBox(
            width: 172,
            child: Padding(
              padding: const EdgeInsets.only(top: TSizes.sm, left: TSizes.sm),
              child: Column(
                children: [
                  ProducTitleText(
                    title: 'Green Nike Half Sleeves Shirt',
                    smallSize: true,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems / 2,
                  ),
                  BrandTitleWithVerifiedIcon(title: 'Nike'),
                  const Spacer(),
                  SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Price
                        Flexible(
                          child: ProductPriceText(
                            price: '35',
                            isLarge: true,
                          ),
                        ),
                        // Button
                        AddCardButton(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(TSizes.cardRadiusMd),
                            bottomRight:
                                Radius.circular(TSizes.productImageRadius),
                          ),
                          icon: Iconsax.add,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
