import 'package:flutter/material.dart';
import 'package:winter_store/commons/widgets/appbar/appbar.dart';
import 'package:winter_store/commons/widgets/brands/brand_card.dart';
import 'package:winter_store/commons/widgets/texts/section_heading.dart';
import 'package:winter_store/features/shop/controllers/brand_controller.dart';
import 'package:winter_store/features/shop/models/brand_model.dart';
import 'package:winter_store/features/shop/screens/all_products/widgets/sortable_product.dart';
import 'package:winter_store/utils/constants/sizes.dart';
import 'package:winter_store/utils/helpers/network_help_functions.dart';

class BrandProductsScreen extends StatelessWidget {
  const BrandProductsScreen({super.key, required this.brand});

  final BrandModel brand;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WAppBar(
        showBackArrow: true,
        title: Text(brand.name),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              // Brand details
              BrandCard(brand: brand, showBorder: true),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              SectionHeading(title: 'Products', showActionButton: false),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              FutureBuilder(
                  future: BrandController.instance
                      .getBrandProducts(brandId: brand.id),
                  builder: (_, snapshot) {
                    final widget = NetworkHelpFunctions.checkMultuRecordState(
                        snapshot: snapshot);

                    if (widget != null) return widget;

                    final products = snapshot.data!;

                    return SortableProduct(
                      products: products,
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
