import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:winter_store/commons/widgets/layouts/grid_layout.dart';
import 'package:winter_store/commons/widgets/products/product_cards/product_card_vertical.dart';
import 'package:winter_store/commons/widgets/texts/section_heading.dart';
import 'package:winter_store/features/shop/controllers/categories_controller.dart';
import 'package:winter_store/features/shop/models/cagegory_model.dart';
import 'package:winter_store/features/shop/models/product_model.dart';
import 'package:winter_store/features/shop/screens/all_products/all_products.dart';
import 'package:winter_store/features/shop/screens/store/widgets/category_brand.dart';
import 'package:winter_store/utils/constants/sizes.dart';
import 'package:winter_store/utils/helpers/network_help_functions.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({
    super.key,
    required this.category,
  });

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoriesController.instance;
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              // Brand
              CategoryBrands(category: category),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              // Products

              FutureBuilder<List<ProductModel>>(
                  future: controller.getProductsByCategory(
                      categoryId: category.id, limit: 4),
                  builder: (_, snapshot) {
                    final widget = NetworkHelpFunctions.checkMultuRecordState(
                        snapshot: snapshot);

                    if (widget != null) return widget;

                    final products = snapshot.data!;

                    return Column(
                      children: [
                        SectionHeading(
                          title: "You might like",
                          onButtonPressed: () => Get.to(() => AllProductsScreen(
                                title: category.name,
                                futureMethod: controller.getProductsByCategory(
                                    categoryId: category.id),
                              )),
                        ),
                        const SizedBox(
                          height: TSizes.spaceBtwItems,
                        ),
                        GridLayout(
                            itemCount: products.length,
                            itemBuilder: (_, index) {
                              final product = products[index];
                              return ProductCardVertical(
                                product: product,
                              );
                            })
                      ],
                    );
                  })
            ],
          ),
        ),
      ],
    );
  }
}
