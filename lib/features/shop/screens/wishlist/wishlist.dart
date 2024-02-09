import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:winter_store/commons/widgets/appbar/appbar.dart';
import 'package:winter_store/commons/widgets/custom_shapes/icons/circular_icon.dart';
import 'package:winter_store/commons/widgets/layouts/grid_layout.dart';
import 'package:winter_store/commons/widgets/products/product_cards/product_card_vertical.dart';
import 'package:winter_store/features/shop/controllers/favorites_controller.dart';
import 'package:winter_store/features/shop/screens/home/home.dart';
import 'package:winter_store/utils/constants/sizes.dart';
import 'package:winter_store/utils/helpers/network_help_functions.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = FavoritesController.instance;
    return Scaffold(
      appBar: WAppBar(
        title: Text(
          "WishList",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          CircularIcon(
            icon: Iconsax.add,
            onPressed: () => Get.to(const HomeScreen()),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              FutureBuilder(
                future: controller.favoriteProducts(),
                builder: (_, snapshot) {
                  final widget = NetworkHelpFunctions.checkMultuRecordState(
                      snapshot: snapshot);
                  if (widget != null) {
                    return widget;
                  }

                  final listProducts = snapshot.data!;

                  return GridLayout(
                      itemCount: listProducts.length,
                      itemBuilder: (_, index) =>
                          ProductCardVertical(product: listProducts[index]));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
