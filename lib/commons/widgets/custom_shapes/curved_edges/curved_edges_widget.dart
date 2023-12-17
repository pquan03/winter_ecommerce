import 'package:flutter/material.dart';
import 'package:t_store/commons/widgets/custom_shapes/curved_edges/curved_edges.dart';

class CustomCurvedEdges extends StatelessWidget {
  const CustomCurvedEdges({
    super.key,
    this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CustomCurvedEdge(),
      child: child,
    );
  }
}


