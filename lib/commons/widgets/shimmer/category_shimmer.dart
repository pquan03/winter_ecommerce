import 'package:flutter/material.dart';
import 'package:winter_store/commons/widgets/shimmer/shimmer_effect.dart';
import 'package:winter_store/utils/constants/sizes.dart';

class WCategoryShimmer extends StatelessWidget {
  const WCategoryShimmer({
    super.key,
    this.itemCount = 6,
  });

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: itemCount,
        separatorBuilder: (_, index) => const SizedBox(
          width: TSizes.spaceBtwItems,
        ),
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          return Column(
            children: [
              //
              ShimmerEffect(
                width: 56,
                height: 56,
                radius: 56,
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems / 2,
              ),
              ShimmerEffect(width: 55, height: 8)
            ],
          );
        },
      ),
    );
  }
}
