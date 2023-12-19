import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/sizes.dart';

class GridLayout extends StatelessWidget {
  const GridLayout(
      {super.key,
      required this.itemCount,
      required this.itemBuilder,
      this.mainAxisExtent = 288});

  final int itemCount;
  final double? mainAxisExtent;
  final Widget? Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: itemCount,
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: TSizes.gridViewSpacing,
            crossAxisSpacing: TSizes.gridViewSpacing,
            mainAxisExtent: mainAxisExtent),
        itemBuilder: itemBuilder);
  }
}
