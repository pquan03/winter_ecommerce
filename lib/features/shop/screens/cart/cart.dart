import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/commons/widgets/appbar/appbar.dart';
import 'package:t_store/commons/widgets/products/cart/cart_item.dart';
import 'package:t_store/commons/widgets/products/product_cards/product_quantity_with_button.dart';
import 'package:t_store/commons/widgets/texts/product_price_text.dart';
import 'package:t_store/features/shop/screens/check_out/check_out.dart';
import 'package:t_store/utils/constants/sizes.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // App bar
      appBar: WAppBar(
        title: const Text('Cart'),
        showBackArrow: true,
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
            onPressed: () => Get.to(() => const CheckoutScreen()),
            child: Text('Checkout \$100')),
      ),
      // Body
      body: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: 10,
            separatorBuilder: (_, __) => const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            itemBuilder: (_, index) {
              return Column(
                children: [
                  WCartItem(),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          // Extra space
                          const SizedBox(
                            width: 70,
                          ),

                          // Add, Remove Button
                          WProductQuantityWithAddRemoveButton(),
                        ],
                      ),
                      ProductPriceText(price: '256')
                    ],
                  )
                ],
              );
            },
          )),
    );
  }
}
