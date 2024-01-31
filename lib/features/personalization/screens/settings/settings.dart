import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:winter_store/commons/widgets/appbar/appbar.dart';
import 'package:winter_store/commons/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:winter_store/commons/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:winter_store/commons/widgets/list_tile/setting_menu_tile.dart';
import 'package:winter_store/commons/widgets/list_tile/user_profile_tile.dart';
import 'package:winter_store/commons/widgets/texts/section_heading.dart';
import 'package:winter_store/data/repositories/authentication/authentication_repository.dart';
import 'package:winter_store/features/authentication/screens/login/login.dart';
import 'package:winter_store/features/personalization/screens/address/address.dart';
import 'package:winter_store/features/personalization/screens/orders/orders.dart';
import 'package:winter_store/features/shop/screens/upload_data/upload_data.dart';
import 'package:winter_store/utils/constants/colors.dart';
import 'package:winter_store/utils/constants/sizes.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            PrimaryHeaderContainer(
                child: Column(
              children: [
                // App bar
                WAppBar(
                  title: Text(
                    'Account',
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .apply(color: TColors.white),
                  ),
                ),
                // User profile card
                UserProfileTile(),
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                )
              ],
            )),
            // Body
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  // Account settings
                  SectionHeading(
                    title: "Account Settings",
                    showActionButton: false,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  SettingMenuTile(
                    icon: Iconsax.safe_home,
                    title: "My addresses",
                    subtitle: "Set shopping delivery address",
                    onTap: () => Get.to(() => const AddressesScreen()),
                  ),
                  SettingMenuTile(
                      icon: Iconsax.shopping_cart,
                      title: "My Cart",
                      subtitle: "Add, remove products and move to checkout"),
                  SettingMenuTile(
                    icon: Iconsax.bag_tick,
                    title: "My Orders",
                    subtitle: "in-progess and completed order",
                    onTap: () => Get.to(() => const OrdersScreen()),
                  ),
                  SettingMenuTile(
                      icon: Iconsax.bank,
                      title: "Bank account",
                      subtitle: "Withdraw balance to registered bank account"),
                  SettingMenuTile(
                      icon: Iconsax.discount_shape,
                      title: "My Coupons",
                      subtitle: "List of all the discounted coupons"),
                  SettingMenuTile(
                      icon: Iconsax.notification,
                      title: "Notifications",
                      subtitle: "Set any kind of notification message"),
                  SettingMenuTile(
                      icon: Iconsax.security_card,
                      title: "Account privacy",
                      subtitle: "Manage data usage and connected accounts"),

                  // App settings
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  SectionHeading(
                    title: "App settings",
                    showActionButton: false,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  SettingMenuTile(
                    icon: Iconsax.document_upload,
                    title: "Load Data",
                    subtitle: "Upload data to your clould firebase",
                    onTap: () => Get.to(() => const UploadDataScreen()),
                  ),
                  SettingMenuTile(
                    icon: Iconsax.location,
                    title: "GeoLocation",
                    subtitle: "Set recommendation based on location",
                    trailing: Switch(value: false, onChanged: (value) {}),
                  ),
                  SettingMenuTile(
                    icon: Iconsax.security_user,
                    title: "Safe Mode",
                    subtitle: "Search result is safe for all ages",
                    trailing: Switch(value: false, onChanged: (value) {}),
                  ),
                  SettingMenuTile(
                    icon: Iconsax.image,
                    title: "HD Image Quality",
                    subtitle: "Set image quality to be seen",
                    trailing: Switch(value: false, onChanged: (value) {}),
                  ),

                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),

                  SizedBox(
                    width: double.infinity,
                    child: RoundedContainer(
                      showBorder: true,
                      child: TextButton(
                        onPressed: () => logout(context),
                        child: Text(
                          'Logout',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  logout(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text('Login'),
            content: Text('Do you really want to logout?'),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.pop(context); //close Dialog
                  },
                  child: Text('Close')),
              TextButton(
                onPressed: () {
                  AuthenticationRepository.instance.logout();
                  Get.offAll(() => const LoginScreen());
                },
                child: Text('Yes'),
              )
            ],
          );
        });
  }
}
