import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:winter_store/commons/widgets/layouts/grid_layout.dart';
import 'package:winter_store/commons/widgets/products/product_cards/product_card_vertical.dart';
import 'package:winter_store/features/shop/controllers/all_product_controller.dart';
import 'package:winter_store/features/shop/models/product_model.dart';
import 'package:winter_store/utils/constants/sizes.dart';

class SortableProduct extends StatelessWidget {
  const SortableProduct({
    super.key,
    required this.products,
  });

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductController())
      ..assignProducts(products);
    return Column(
      children: [
        // DropDown
        DropdownButtonFormField(
            decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
            items: ['Name', 'Higher Price', 'Lower Price', 'Sale']
                .map((e) => DropdownMenuItem(
                      value: e,
                      child: Text(e),
                    ))
                .toList(),
            value: controller.selectedSortOption.value,
            onChanged: (value) => controller.sortProducts(value.toString())),
        const SizedBox(
          height: TSizes.spaceBtwSections,
        ),
        Obx(
          () => GridLayout(
              itemCount: controller.products.length,
              itemBuilder: (_, index) => ProductCardVertical(
                    product: controller.products[index],
                  )),
        )
      ],
    );
  }
}
