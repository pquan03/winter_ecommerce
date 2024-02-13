import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:winter_store/commons/widgets/appbar/appbar.dart';
import 'package:winter_store/commons/widgets/products/cart/cart_item.dart';
import 'package:winter_store/features/shop/controllers/cart_controller.dart';
import 'package:winter_store/features/shop/screens/check_out/check_out.dart';
import 'package:winter_store/utils/constants/sizes.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    return Scaffold(
      // App bar
      appBar: WAppBar(
        title: const Text('Cart'),
        showBackArrow: true,
      ),

      bottomNavigationBar: controller.cartItems.isEmpty
          ? null
          : Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: ElevatedButton(
                  onPressed: () => Get.to(() => const CheckoutScreen()),
                  child: Text(
                      'Checkout: \$${controller.cartTotalPrice.value.toString()}')),
            ),
      // Body
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Obx(() {
          if (controller.cartItems.isEmpty) {
            return const Center(
              child: Text('No items in cart'),
            );
          }

          return WCartItems();
        }),
      ),
    );
  }
}
