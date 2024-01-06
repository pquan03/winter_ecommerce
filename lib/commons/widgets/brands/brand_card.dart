import 'package:flutter/material.dart';
import 'package:winter_store/commons/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:winter_store/commons/widgets/images/rounded_image.dart';
import 'package:winter_store/commons/widgets/products/product_cards/brand_title_with_verified_icon.dart';
import 'package:winter_store/utils/constants/colors.dart';
import 'package:winter_store/utils/constants/enums.dart';
import 'package:winter_store/utils/constants/image_strings.dart';
import 'package:winter_store/utils/constants/sizes.dart';
import 'package:winter_store/utils/helpers/helper_functions.dart';

class BrandCard extends StatelessWidget {
  const BrandCard({super.key, this.showBorder = true});

  final bool showBorder;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: RoundedContainer(
        padding: const EdgeInsets.all(TSizes.sm),
        showBorder: showBorder,
        backgroundColor: Colors.transparent,
        child: Row(
          children: [
            Flexible(
              child: RoundedImage(
                width: 80,
                height: 80,
                isNetworkImage: false,
                imageUrl: TImages.clothIcon,
                backgroundColor: Colors.transparent,
                overlayColor: THelperFunctions.isDarkMode(context)
                    ? TColors.white
                    : TColors.dark,
              ),
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BrandTitleWithVerifiedIcon(
                    title: "Nike",
                    brandTextSize: TextSizes.large,
                  ),
                  Text(
                    "256 products",
                    style: Theme.of(context).textTheme.labelMedium,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
