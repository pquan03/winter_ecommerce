import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:winter_store/commons/widgets/custom_shapes/icons/circular_icon.dart';

class WFavoriteIcon extends StatelessWidget {
  const WFavoriteIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return CircularIcon(
      icon: Iconsax.heart5,
      color: Colors.red,
    );
  }
}
