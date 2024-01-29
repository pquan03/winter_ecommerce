
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:winter_store/commons/widgets/appbar/appbar.dart';
import 'package:winter_store/commons/widgets/appbar/tabbar.dart';
import 'package:winter_store/commons/widgets/custom_shapes/containers/search_container.dart';
import 'package:winter_store/commons/widgets/layouts/grid_layout.dart';
import 'package:winter_store/commons/widgets/products/cart/cart_menu_icon.dart';
import 'package:winter_store/commons/widgets/texts/section_heading.dart';
import 'package:winter_store/commons/widgets/brands/brand_card.dart';
import 'package:winter_store/features/shop/controllers/categories_controller.dart';
import 'package:winter_store/features/shop/screens/all_brands/all_brands.dart';
import 'package:winter_store/features/shop/screens/store/widgets/category_tab.dart';
import 'package:winter_store/utils/constants/colors.dart';
import 'package:winter_store/utils/constants/sizes.dart';
import 'package:winter_store/utils/helpers/helper_functions.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = CategoriesController.instance.featuredCategories;
    final dark = THelperFunctions.isDarkMode(context);
    final length = categories.length;
    return DefaultTabController(
      length: length,
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

                          GridLayout(
                              itemCount: 4,
                              mainAxisExtent: 80,
                              itemBuilder: (_, index) {
                                return BrandCard(
                                  showBorder: false,
                                );
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
