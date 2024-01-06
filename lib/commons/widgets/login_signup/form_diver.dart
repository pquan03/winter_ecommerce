import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:winter_store/utils/constants/colors.dart';
import 'package:winter_store/utils/helpers/helper_functions.dart';

class FormDivider extends StatelessWidget {
  const FormDivider({
    super.key,
    required this.dividerString,
  });

  final String dividerString;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Divider(
            color: dark ? TColors.darkGrey : TColors.grey,
            thickness: 0.5,
            indent: 60,
            endIndent: 5,
          ),
        ),
        Text(
          dividerString.capitalize!,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        Flexible(
          child: Divider(
            color: dark ? TColors.darkGrey : TColors.grey,
            thickness: 0.5,
            indent: 60,
            endIndent: 5,
          ),
        ),
      ],
    );
  }
}
