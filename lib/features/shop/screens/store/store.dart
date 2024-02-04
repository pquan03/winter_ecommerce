import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:winter_store/commons/widgets/appbar/appbar.dart';
import 'package:winter_store/commons/widgets/appbar/tabbar.dart';
import 'package:winter_store/commons/widgets/custom_shapes/containers/search_container.dart';
import 'package:winter_store/commons/widgets/layouts/grid_layout.dart';
import 'package:winter_store/commons/widgets/products/cart/cart_menu_icon.dart';
import 'package:winter_store/commons/widgets/shimmer/brand_shimmer.dart';
import 'package:winter_store/commons/widgets/texts/section_heading.dart';
import 'package:winter_store/commons/widgets/brands/brand_card.dart';
import 'package:winter_store/features/shop/controllers/brand_controller.dart';
import 'package:winter_store/features/shop/controllers/categories_controller.dart';
import 'package:winter_store/features/shop/screens/all_brands/all_brands.dart';
import 'package:winter_store/features/shop/screens/brand_products/brand_products.dart';
import 'package:winter_store/features/shop/screens/store/widgets/category_tab.dart';
import 'package:winter_store/utils/constants/colors.dart';
import 'package:winter_store/utils/constants/sizes.dart';
import 'package:winter_store/utils/helpers/helper_functions.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brandController = Get.put(BrandController());
    final categories = CategoriesController.instance.featuredCategories;
    final dark = THelperFunctions.isDarkMode(context);
    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: WAppBar(
          title: Text(
            "Store",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          actions: [
            CartCounterIcon(
              onPressed: () {},
              color: dark ? TColors.light : TColors.dark,
            )
          ],
        ),
        body: NestedScrollView(
            headerSliverBuilder: (_, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                    automaticallyImplyLeading: false,
                    pinned: true,
                    floating: true,
                    backgroundColor: THelperFunctions.isDarkMode(context)
                        ? TColors.black
                        : TColors.white,
                    expandedHeight: 440,
                    flexibleSpace: Padding(
                      padding: EdgeInsets.all(TSizes.defaultSpace),
                      child: ListView(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          // Search bar
                          const SizedBox(
                            height: TSizes.spaceBtwItems,
                          ),
                          const SearchContainer(
                            text: "Search in store",
                            showBorder: true,
                            showBackground: true,
                            padding: EdgeInsets.zero,
                          ),
                          const SizedBox(
                            height: TSizes.spaceBtwSections,
                          ),

                          // Featured Brands
                          SectionHeading(
                            title: "Featured Brands",
                            showActionButton: true,
                            onButtonPressed: () =>
                                Get.to(() => const AllBrandsScreen()),
                          ),
                          const SizedBox(
                            height: TSizes.spaceBtwItems / 2,
                          ),

                          Obx(() {
                            if (brandController.isLoading.value) {
                              return WBrandShimmer();
                            }

                            if (brandController.featuredBrands.isEmpty) {
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
                                itemCount:
                                    brandController.featuredBrands.length,
                                mainAxisExtent: 80,
                                itemBuilder: (_, index) {
                                  final brand =
                                      brandController.featuredBrands[index];
                                  return BrandCard(
                                    showBorder: true,
                                    brand: brand,
                                    onTap: () =>
                                        Get.to(() => BrandProductsScreen(
                                              brand: brand,
                                            )),
                                  );
                                });
                          })
                        ],
                      ),
                    ),
                    bottom: WTabBar(
                        tabs: categories
                            .map((element) =>
                                Tab(child: SizedBox(child: Text(element.name))))
                            .toList())),
              ];
            },
            body: TabBarView(
              children: categories
                  .map((element) => CategoryTab(
                        category: element,
                      ))
                  .toList(),
            )),
      ),
    );
  }
}
