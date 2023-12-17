import 'package:flutter/material.dart';
import 'package:t_store/commons/widgets/appbar/appbar.dart';
import 'package:t_store/commons/widgets/products/cart/cart_menu_icon.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/text_strings.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return WAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            TTexts.homeAppbarTitle,
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .apply(color: TColors.grey),
          ),
          Text(
            TTexts.homeAppbarSubTitle,
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .apply(color: TColors.white),
          )
        ],
      ),
      actions: [
        CartCounterIcon(
          color: TColors.white,
          onPressed: () {},
        )
      ],
    );
  }
}