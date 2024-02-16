import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:winter_store/commons/widgets/products/cart/cart_item_info.dart';
import 'package:winter_store/commons/widgets/products/product_cards/product_quantity_with_button.dart';
import 'package:winter_store/commons/widgets/texts/product_price_text.dart';
import 'package:winter_store/features/shop/controllers/cart_controller.dart';
import 'package:winter_store/utils/constants/sizes.dart';

class WCartItems extends StatelessWidget {
  const WCartItems({
    super.key,
    this.showAddRemoveButtons = true,
  });

  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    return Obx(
      () => ListView.separated(
        shrinkWrap: true,
        itemCount: controller.cartItems.length,
        separatorBuilder: (_, __) => const SizedBox(
          height: TSizes.spaceBtwSections,
        ),
        itemBuilder: (_, index) {
          final cartItem = controller.cartItems[index];
          return Column(
            children: [
              WCartItemInfo(
                cartItem: cartItem,
              ),
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
                      if (showAddRemoveButtons)
                        WProductQuantityWithAddRemoveButton(
                          quantity: cartItem.quantity,
                          add: () => controller.addOneItemToCart(cartItem),
                          remove: () =>
                              controller.removeOneItemFromCart(cartItem),
                        ),
                    ],
                  ),
                  if (showAddRemoveButtons)
                    ProductPriceText(price: cartItem.price.toStringAsFixed(1))
                ],
              )
            ],
          );
        },
      ),
    );
  }
}
