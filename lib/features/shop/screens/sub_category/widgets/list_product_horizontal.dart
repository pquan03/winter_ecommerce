import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:winter_store/commons/widgets/products/product_cards/product_card_horizontal.dart';
import 'package:winter_store/commons/widgets/texts/section_heading.dart';
import 'package:winter_store/features/shop/screens/all_products/all_products.dart';
import 'package:winter_store/utils/constants/sizes.dart';

class SubCategorySection extends StatelessWidget {
  const SubCategorySection({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionHeading(
          title: title,
          buttonTitle: 'View all',
          onButtonPressed: () => Get.to(() => AllProductsScreen(title: title)),
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        SizedBox(
          height: 120,
          child: ListView.separated(
            itemCount: 4,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (_, __) => const SizedBox(
              width: TSizes.spaceBtwItems,
            ),
            itemBuilder: (_, index) => const ProductCardHorizontal(),
          ),
        ),
        const SizedBox(
          height: TSizes.spaceBtwSections,
        ),
      ],
    );
  }
}
