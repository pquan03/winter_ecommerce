import 'package:flutter/material.dart';
import 'package:winter_store/commons/widgets/layouts/grid_layout.dart';
import 'package:winter_store/commons/widgets/shimmer/shimmer_effect.dart';

class WBrandShimmer extends StatelessWidget {
  const WBrandShimmer({super.key, this.count = 4});

  final int count;

  @override
  Widget build(BuildContext context) {
    return GridLayout(
        itemCount: count,
        mainAxisExtent: 80,
        itemBuilder: (_, __) => ShimmerEffect(width: 300, height: 80));
  }
}
