import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:winter_store/commons/widgets/products/product_cards/product_card_horizontal.dart';
import 'package:winter_store/commons/widgets/texts/section_heading.dart';
import 'package:winter_store/features/shop/controllers/categories_controller.dart';
import 'package:winter_store/features/shop/models/cagegory_model.dart';
import 'package:winter_store/features/shop/screens/all_products/all_products.dart';
import 'package:winter_store/utils/constants/sizes.dart';
import 'package:winter_store/utils/helpers/network_help_functions.dart';

class SubCategorySection extends StatelessWidget {
  const SubCategorySection({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoriesController.instance;
    return Column(
      children: [
        SectionHeading(
          title: category.name,
          buttonTitle: 'View all',
          onButtonPressed: () => Get.to(() => AllProductsScreen(
                title: category.name,
                futureMethod:
                    controller.getProductsByCategory(categoryId: category.id),
              )),
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        SizedBox(
          height: 120,
          child: FutureBuilder(
            future: controller.getProductsByCategory(categoryId: category.id),
            builder: (_, snapshot) {
              final widget = NetworkHelpFunctions.checkMultuRecordState(
                  snapshot: snapshot);
              if (widget != null) {
                return widget;
              }

              final listProducts = snapshot.data!;

              return ListView.separated(
                itemCount: listProducts.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (_, __) => const SizedBox(
                  height: TSizes.spaceBtwItems,
                ),
                itemBuilder: (_, index) {
                  final product = listProducts[index];
                  return ProductCardHorizontal(product: product);
                },
              );
            },
          ),
        ),
        const SizedBox(
          height: TSizes.spaceBtwSections,
        ),
      ],
    );
  }
}
