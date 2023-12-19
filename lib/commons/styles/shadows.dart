import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/colors.dart';

class ShadowsStyle {
  static final verticalProductShadow = BoxShadow(
      color: TColors.darkGrey.withOpacity(.1),
      blurRadius: 50,
      spreadRadius: 7,
      offset: const Offset(0, 2));

  static final horizontalProductShadow = BoxShadow(
      color: TColors.darkGrey.withOpacity(.1),
      blurRadius: 50,
      spreadRadius: 7,
      offset: const Offset(2, 0));
}
