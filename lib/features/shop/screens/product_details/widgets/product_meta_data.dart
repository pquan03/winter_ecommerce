import 'package:flutter/material.dart';
import 'package:winter_store/commons/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:winter_store/commons/widgets/products/product_cards/brand_title_with_verified_icon.dart';
import 'package:winter_store/commons/widgets/products/text/product_title_text.dart';
import 'package:winter_store/commons/widgets/texts/product_price_text.dart';
import 'package:winter_store/features/shop/models/product_model.dart';
import 'package:winter_store/utils/constants/colors.dart';
import 'package:winter_store/utils/constants/enums.dart';
import 'package:winter_store/utils/constants/sizes.dart';
import 'package:winter_store/utils/helpers/helper_functions.dart';

class ProductMetaData extends StatelessWidget {
  const ProductMetaData({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Prict & Sale price
        Row(
          children: [
            // Sale tag
            RoundedContainer(
              radius: TSizes.sm,
              backgroundColor: TColors.secondary.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(
                  horizontal: TSizes.sm, vertical: TSizes.xs),
              child: Text(
                '${THelperFunctions.getPercentageOfPrice(product.price, product.salePrice!)}%',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .apply(color: TColors.black),
              ),
            ),
            const SizedBox(
              width: TSizes.spaceBtwItems,
            ),
            Text(
              product.price.toString(),
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .apply(decoration: TextDecoration.lineThrough),
            ),
            const SizedBox(
              width: TSizes.spaceBtwItems,
            ),
            ProductPriceText(
              price: product.salePrice!.toString(),
              isLarge: true,
            )
          ],
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems / 1.5,
        ),
        // Title
        Text(
          product.title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems / 1.5,
        ),
        // Stock
        Row(
          children: [
            const ProducTitleText(title: "Status:"),
            const SizedBox(
              width: TSizes.spaceBtwItems,
            ),
            Text(
              "In Stock",
              style: Theme.of(context).textTheme.titleMedium,
            )
          ],
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems / 1.5,
        ),
        // Brand
        Row(
          children: [
            Image(
              image: NetworkImage(product.brand!.image),
              width: 20,
              height: 20,
              color: THelperFunctions.isDarkMode(context)
                  ? TColors.white
                  : TColors.dark,
            ),
            const SizedBox(
              width: TSizes.spaceBtwItems,
            ),
            BrandTitleWithVerifiedIcon(
              title: product.brand?.name ?? "Winter",
              brandTextSize: TextSizes.large,
              iconSize: TSizes.iconSm,
            )
          ],
        )
      ],
    );
  }
}
