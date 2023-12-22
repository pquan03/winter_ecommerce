import 'package:flutter/material.dart';
import 'package:t_store/commons/widgets/appbar/appbar.dart';
import 'package:t_store/commons/widgets/appbar/tabbar.dart';
import 'package:t_store/commons/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:t_store/commons/widgets/custom_shapes/containers/search_container.dart';
import 'package:t_store/commons/widgets/layouts/grid_layout.dart';
import 'package:t_store/commons/widgets/products/cart/cart_menu_icon.dart';
import 'package:t_store/commons/widgets/texts/section_heading.dart';
import 'package:t_store/features/shop/screens/store/widgets/brand_card.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: WAppBar(
          title: Text(
            "Store",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          actions: [CartCounterIcon(onPressed: () {})],
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
                  bottom: WTabBar(tabs: [
                    Tab(
                      child: Text('Sports'),
                    ),
                    Tab(
                      child: Text('Furniture'),
                    ),
                    Tab(
                      child: Text('Electronics'),
                    ),
                    Tab(
                      child: Text('Clothes'),
                    ),
                    Tab(
                      child: Text('Cosmetics'),
                    ),
                  ])),
            ];
          },
          body: TabBarView(
            children: [
              Padding(
                padding: const EdgeInsets.all(TSizes.defaultSpace),
                child: Column(
                  children: [
                    RoundedContainer(
                      showBorder: true,
                      borderColor: TColors.darkGrey,
                      backgroundColor: Colors.transparent,
                      margin:
                          const EdgeInsets.only(bottom: TSizes.defaultSpace),
                      child: Column(
                        children: [
                          const BrandCard(
                            showBorder: false,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
