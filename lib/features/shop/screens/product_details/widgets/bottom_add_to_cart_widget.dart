import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/commons/widgets/custom_shapes/icons/circular_icon.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class BottomAddToCard extends StatelessWidget {
  const BottomAddToCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: TSizes.defaultSpace / 2,
        horizontal: TSizes.defaultSpace,
      ),
      decoration: BoxDecoration(
          color: dark ? TColors.darkerGrey : TColors.light,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(TSizes.cardRadiusLg),
            topRight: Radius.circular(TSizes.cardRadiusLg),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircularIcon(
                icon: Iconsax.minus,
                backgroundColor: TColors.darkGrey,
                width: 40,
                height: 40,
                color: TColors.white,
              ),
              const SizedBox(
                width: TSizes.spaceBtwItems,
              ),
              Text(
                '2',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(
                width: TSizes.spaceBtwItems,
              ),
              CircularIcon(
                icon: Iconsax.add,
                backgroundColor: TColors.black,
                width: 40,
                height: 40,
                color: TColors.white,
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(TSizes.sm),
                backgroundColor: TColors.black,
                side: const BorderSide(color: TColors.black)),
            child: const Text("Add to Cart"),
          )
        ],
      ),
    );
  }
}
