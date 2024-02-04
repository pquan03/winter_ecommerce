import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:winter_store/commons/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:winter_store/commons/widgets/custom_shapes/containers/search_container.dart';
import 'package:winter_store/commons/widgets/layouts/grid_layout.dart';
import 'package:winter_store/commons/widgets/products/product_cards/product_card_vertical.dart';
import 'package:winter_store/commons/widgets/texts/section_heading.dart';
import 'package:winter_store/features/shop/controllers/product_controller.dart';
import 'package:winter_store/features/shop/screens/all_products/all_products.dart';
import 'package:winter_store/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:winter_store/features/shop/screens/home/widgets/home_categories.dart';
import 'package:winter_store/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:winter_store/utils/constants/sizes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            PrimaryHeaderContainer(
              child: Column(
                children: [
                  // AppBar
                  HomeAppBar(),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  // Search Bar
                  SearchContainer(
                    text: "Search in Store",
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  // Categories
                  Padding(
                    padding: const EdgeInsets.only(left: TSizes.defaultSpace),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Heading
                        SectionHeading(
                          title: "Popular Categories",
                          showActionButton: false,
                          textColor: Colors.white,
                        ),
                        const SizedBox(
                          height: TSizes.spaceBtwItems,
                        ),
                        // Categories
                        HomeCategories(),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  )
                ],
              ),
            ),
            // Body
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  PromoSlider(),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  SectionHeading(
                    title: 'Popular Products',
                    onButtonPressed: () => Get.to(() => AllProductsScreen(
                          title: 'Popular Products',
                          query: FirebaseFirestore.instance
                              .collection('products')
                              .where('isFeatured', isEqualTo: true)
                              .limit(6),
                          futureMethod: controller.fetchAllFeaturedProducts(),
                        )),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  Obx(() {
                    if (controller.isLoading.value) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (controller.featuredProducts.isEmpty) {
                      return const Center(child: Text('No products found'));
                    }

                    return GridLayout(
                        itemCount: controller.featuredProducts.length,
                        mainAxisExtent: 288,
                        itemBuilder: (_, index) => ProductCardVertical(
                              product: controller.featuredProducts[index],
                            ));
                  })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
