import 'package:flutter/material.dart';
import 'package:winter_store/commons/widgets/images/rounded_image.dart';
import 'package:winter_store/commons/widgets/products/product_cards/brand_title_with_verified_icon.dart';
import 'package:winter_store/commons/widgets/products/text/product_title_text.dart';
import 'package:winter_store/utils/constants/colors.dart';
import 'package:winter_store/utils/constants/image_strings.dart';
import 'package:winter_store/utils/constants/sizes.dart';
import 'package:winter_store/utils/helpers/helper_functions.dart';

class WCartItem extends StatelessWidget {
  const WCartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RoundedImage(
            width: 60,
            height: 60,
            padding: const EdgeInsets.all(TSizes.sm),
            backgroundColor: THelperFunctions.isDarkMode(context)
                ? TColors.darkGrey
                : TColors.grey,
            imageUrl: TImages.productImage1),
        const SizedBox(
          width: TSizes.spaceBtwItems,
        ),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BrandTitleWithVerifiedIcon(title: 'iPhone 14'),
              ProducTitleText(
                title: 'Appe Iphone 14 Pro max Pro Vip, Super Pro Pro max',
                maxLines: 1,
              ),
              Text.rich(TextSpan(children: [
                TextSpan(
                    text: 'Color ',
                    style: Theme.of(context).textTheme.bodySmall),
                TextSpan(
                    text: 'Purple ',
                    style: Theme.of(context).textTheme.bodyLarge),
                TextSpan(
                    text: 'Size ',
                    style: Theme.of(context).textTheme.bodySmall),
                TextSpan(
                    text: '256GB ',
                    style: Theme.of(context).textTheme.bodyLarge),
              ]))
            ],
          ),
        )
      ],
    );
  }
}
