import 'package:flutter/material.dart';
import 'package:t_store/commons/widgets/brands/brand_show_case.dart';
import 'package:t_store/commons/widgets/layouts/grid_layout.dart';
import 'package:t_store/commons/widgets/products/product_cards/product_card_vertical.dart';
import 'package:t_store/commons/widgets/texts/section_heading.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              // Product
              BrandShowCase(
                images: [
                  TImages.productImage6,
                  TImages.productImage4,
                  TImages.productImage3,
                ],
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              BrandShowCase(
                images: [
                  TImages.productImage6,
                  TImages.productImage4,
                  TImages.productImage3,
                ],
              ),
              // Products
              SectionHeading(
                title: "You might like",
                onButtonPressed: () {},
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              GridLayout(
                  itemCount: 4,
                  itemBuilder: (_, index) => const ProductCardVertical())
            ],
          ),
        ),
      ],
    );
  }
}
