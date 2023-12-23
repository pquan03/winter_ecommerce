import 'package:flutter/material.dart';
import 'package:t_store/commons/widgets/brands/brand_card.dart';
import 'package:t_store/commons/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class BrandShowCase extends StatelessWidget {
  const BrandShowCase({super.key, required this.images});

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      showBorder: true,
      borderColor: TColors.darkGrey,
      backgroundColor: Colors.transparent,
      margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
      padding: const EdgeInsets.all(TSizes.md),
      child: Column(
        children: [
          // Brands with product count
          BrandCard(
            showBorder: false,
          ),

          // Brand top 3 products
          Row(
              children:
                  images.map((e) => brandTopProductImage(e, context)).toList())
        ],
      ),
    );
  }

  Widget brandTopProductImage(String image, BuildContext context) {
    return Expanded(
      child: RoundedContainer(
        height: 100,
        backgroundColor: THelperFunctions.isDarkMode(context)
            ? TColors.darkGrey
            : TColors.light,
        margin: const EdgeInsets.only(right: TSizes.sm),
        padding: const EdgeInsets.all(TSizes.md),
        child: Image(
          image: AssetImage(image),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}