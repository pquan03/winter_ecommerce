import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:winter_store/commons/widgets/appbar/appbar.dart';
import 'package:winter_store/commons/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:winter_store/commons/widgets/products/cart/cart_item.dart';
import 'package:winter_store/commons/widgets/products/check_out/billing_address_section.dart';
import 'package:winter_store/commons/widgets/products/check_out/billing_amount_section.dart';
import 'package:winter_store/commons/widgets/products/check_out/billing_payment_section.dart';
import 'package:winter_store/commons/widgets/success_screen/success_screen.dart';
import 'package:winter_store/features/shop/controllers/cart_controller.dart';
import 'package:winter_store/features/shop/screens/check_out/widgets/coupon_code.dart';
import 'package:winter_store/navigation_menu.dart';
import 'package:winter_store/utils/constants/image_strings.dart';
import 'package:winter_store/utils/constants/sizes.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    return Scaffold(
      // App bar
      appBar: WAppBar(
        title: const Text('Order Review'),
        showBackArrow: true,
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
            onPressed: () => Get.to(() => SuccessScreen(
                image: TImages.successfulPaymentIcon,
                title: 'Payment Success!',
                subtitle: 'Your item will be shipped soon!',
                onPressed: () => Get.offAll(() => const NavigationMenu()))),
            child: Text(
                'Checkout \$${cartController.cartTotalPrice.toStringAsFixed(1)}')),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              // List product
              WCartItems(
                showAddRemoveButtons: false,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              // Apply Promo
              CouponCode(),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              // Order Info
              RoundedContainer(
                showBorder: true,
                padding: const EdgeInsets.all(TSizes.md),
                child: Column(
                  children: [
                    // Total Price
                    Column(
                      children: [
                        WBillingAmountSection(
                          title: 'Subtotal',
                          price:
                              cartController.cartTotalPrice.toStringAsFixed(1),
                        ),
                        WBillingAmountSection(
                          title: 'Shipping Fee',
                          price: '5.00',
                        ),
                        WBillingAmountSection(
                          title: 'Tax Fee',
                          price: '10.4',
                        ),
                        const SizedBox(
                          height: TSizes.spaceBtwItems,
                        ),

                        // Order total
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Order total',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            Text('\$${cartController.cartTotalPrice}',
                                style: Theme.of(context).textTheme.titleMedium)
                          ],
                        ),
                        const SizedBox(
                          height: TSizes.spaceBtwItems,
                        ),
                        const Divider(),
                        const SizedBox(
                          height: TSizes.spaceBtwSections,
                        ),

                        // Payment method

                        WPaymentSection(),

                        const SizedBox(
                          height: TSizes.spaceBtwSections,
                        ),

                        // Shipping Address Section
                        WShippingAddressSection()
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
