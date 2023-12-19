import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';

class RoundedContainer extends StatelessWidget {
  const RoundedContainer(
      {super.key,
      this.child,
      this.width,
      this.height,
      this.margin,
      this.padding,
      this.showBorder = false,
      this.radius = TSizes.cardRadiusLg,
      this.backgroundColor,
      this.borderColor = TColors.borderPrimary});

  final double? width, height;
  final double radius;
  final Widget? child;
  final bool showBorder;
  final Color borderColor;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(radius),
        border: showBorder ? Border.all(color: borderColor) : null,
      ),
      child: child,
    );
  }
}
