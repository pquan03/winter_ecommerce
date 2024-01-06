import 'package:flutter/material.dart';
import 'package:winter_store/commons/widgets/custom_shapes/containers/circular_container.dart';
import 'package:winter_store/utils/constants/colors.dart';
import 'package:winter_store/utils/helpers/helper_functions.dart';

class WChoiceChip extends StatelessWidget {
  const WChoiceChip(
      {super.key, required this.text, required this.selected, this.onSelected});

  final String text;
  final bool selected;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    final isColor = THelperFunctions.getColor(text) != null;
    return ChoiceChip(
      label: isColor ? const SizedBox() : Text(text),
      selected: selected,
      onSelected: onSelected,
      labelStyle: TextStyle(color: selected ? TColors.white : null),
      avatar: isColor
          ? CircularContainer(
              width: 50,
              height: 50,
              backgroundColor: THelperFunctions.getColor(text)!)
          : null,
      shape: isColor ? CircleBorder() : null,
      labelPadding: isColor ? const EdgeInsets.all(0) : null,
      padding: isColor ? const EdgeInsets.all(0) : null,
      backgroundColor: isColor ? THelperFunctions.getColor(text)! : null,
    );
  }
}
