import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:winter_store/commons/widgets/appbar/appbar.dart';
import 'package:winter_store/commons/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:winter_store/commons/widgets/custom_shapes/icons/circular_icon.dart';
import 'package:winter_store/commons/widgets/images/rounded_image.dart';
import 'package:winter_store/utils/constants/colors.dart';
import 'package:winter_store/utils/constants/image_strings.dart';
import 'package:winter_store/utils/constants/sizes.dart';
import 'package:winter_store/utils/helpers/helper_functions.dart';

class ProductImageSlider extends StatelessWidget {
  const ProductImageSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return CustomCurvedEdges(
      child: Container(
        color: dark ? TColors.darkerGrey : TColors.light,
        child: Stack(children: [
          // Main Large Image
          SizedBox(
              height: 400,
              child: Padding(
                  padding: const EdgeInsets.all(TSizes.productImageRadius * 2),
                  child: Center(
                      child: Image(image: AssetImage(TImages.productImage1))))),
          // Image slider
          Positioned(
            bottom: 30,
            right: 0,
            child: SizedBox(
              height: 80,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemBuilder: (_, index) => RoundedImage(
                      width: 80,
                      backgroundColor: dark ? TColors.dark : TColors.white,
                      padding: const EdgeInsets.all(TSizes.sm),
                      border: Border.all(color: TColors.primary),
                      imageUrl: TImages.productImage3),
                  separatorBuilder: (_, index) => const SizedBox(
                        width: TSizes.spaceBtwItems,
                      ),
                  itemCount: 8),
            ),
          ),
          // Appbar icons
          const WAppBar(
            showBackArrow: true,
            actions: [
              CircularIcon(
                icon: Iconsax.heart5,
                color: Colors.red,
              )
            ],
          )
        ]),
      ),
    );
  }
}
