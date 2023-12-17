import 'package:flutter/material.dart';
import 'package:t_store/commons/widgets/custom_shapes/containers/circular_container.dart';
import 'package:t_store/commons/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:t_store/utils/constants/colors.dart';

class PrimaryHeaderContainer extends StatelessWidget {
  const PrimaryHeaderContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return CustomCurvedEdges(
      child: Container(
        color: TColors.primary,
        padding: const EdgeInsets.all(0),
        child: SizedBox(
          height: 400,
          child: Stack(
            children: [
              Positioned(
                top: -150,
                right: -250,
                child: CircularContainer(
                  backgroundColor: TColors.textWhite.withOpacity(.1),
                ),
              ),
              Positioned(
                  top: 100,
                  right: -300,
                  child: CircularContainer(
                      backgroundColor: TColors.textWhite.withOpacity(.1))),
              child,
            ],
          ),
        ),
      ),
    );
  }
}
