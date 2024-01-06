import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:winter_store/utils/constants/colors.dart';
import 'package:winter_store/utils/constants/enums.dart';
import 'package:winter_store/utils/constants/sizes.dart';

class BrandTitleWithVerifiedIcon extends StatelessWidget {
  const BrandTitleWithVerifiedIcon(
      {super.key,
      required this.title,
      this.color,
      this.maxLines = 1,
      this.textAlign = TextAlign.center,
      this.brandTextSize = TextSizes.small,
      this.iconSize});

  final String title;
  final Color? color;
  final int maxLines;
  final TextAlign? textAlign;
  final TextSizes brandTextSize;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: thisStyle(context),
        ),
        const SizedBox(
          width: TSizes.xs,
        ),
        Icon(
          Iconsax.verify5,
          color: TColors.primary,
          size: iconSize ?? TSizes.iconSm,
        )
      ],
    );
  }

  TextStyle? thisStyle(BuildContext context) {
    switch (brandTextSize) {
      case TextSizes.small:
        return Theme.of(context).textTheme.labelMedium!.apply(color: color);
      case TextSizes.medium:
        return Theme.of(context).textTheme.bodyLarge!.apply(color: color);
      case TextSizes.large:
        return Theme.of(context).textTheme.titleLarge!.apply(color: color);
      default:
        return Theme.of(context).textTheme.labelMedium!.apply(color: color);
    }
  }
}
