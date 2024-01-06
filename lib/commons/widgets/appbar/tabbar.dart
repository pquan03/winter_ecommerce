import 'package:flutter/material.dart';
import 'package:winter_store/utils/constants/colors.dart';
import 'package:winter_store/utils/device/device_utility.dart';
import 'package:winter_store/utils/helpers/helper_functions.dart';

class WTabBar extends StatelessWidget implements PreferredSizeWidget {
  const WTabBar({super.key, required this.tabs});

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Material(
      color: dark ? TColors.black : TColors.white,
      child: TabBar(
        tabs: tabs,
        padding: EdgeInsets.zero,
        isScrollable: true,
        indicatorColor: TColors.primary,
        unselectedLabelColor: TColors.darkGrey,
        labelColor: dark ? TColors.white : TColors.black,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight());
}
