import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:winter_store/commons/widgets/appbar/appbar.dart';
import 'package:winter_store/commons/widgets/brands/brand_card.dart';
import 'package:winter_store/commons/widgets/layouts/grid_layout.dart';
import 'package:winter_store/commons/widgets/shimmer/brand_shimmer.dart';
import 'package:winter_store/commons/widgets/texts/section_heading.dart';
import 'package:winter_store/features/shop/controllers/brand_controller.dart';
import 'package:winter_store/features/shop/screens/brand_products/brand_products.dart';
import 'package:winter_store/utils/constants/sizes.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return Scaffold(
      // App bar
      appBar: WAppBar(
        title: const Text('Brands'),
        showBackArrow: true,
      ),
      // Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(children: [
            // Heading
            SectionHeading(
              title: 'Brands',
              showActionButton: false,
            ),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            // Grid Brands
            Obx(() {
              if (controller.isLoading.value) {
                return WBrandShimmer();
              }

              if (controller.allBrands.isEmpty) {
                return Center(
                  child: Text(
                    "No Data Found!",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .apply(color: Colors.white),
                  ),
                );
              }

              return GridLayout(
                  itemCount: controller.allBrands.length,
                  mainAxisExtent: 80,
                  itemBuilder: (_, index) {
                    final brand = controller.allBrands[index];
                    return BrandCard(
                        showBorder: true,
                        brand: brand,
                        onTap: () => Get.to(() => BrandProductsScreen(
                              brand: brand,
                            )));
                  });
            })
          ]),
        ),
      ),
    );
  }
}
