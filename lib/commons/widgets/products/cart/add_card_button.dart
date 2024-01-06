import 'package:flutter/material.dart';
import 'package:winter_store/utils/constants/colors.dart';
import 'package:winter_store/utils/constants/sizes.dart';

class AddCardButton extends StatelessWidget {
  const AddCardButton(
      {super.key,
      this.backgroundColor = TColors.black,
      this.iconColor = TColors.white,
      required this.borderRadius,
      required this.icon});

  final Color? iconColor, backgroundColor;
  final BorderRadius borderRadius;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: borderRadius,
      ),
      child: SizedBox(
        width: TSizes.iconLg * 1.2,
        height: TSizes.iconLg * 1.2,
        child: Icon(
          icon,
          color: iconColor,
        ),
      ),
    );
  }
}
