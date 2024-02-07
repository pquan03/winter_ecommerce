import 'package:flutter/material.dart';
import 'package:winter_store/commons/widgets/brands/brand_show_case.dart';
import 'package:winter_store/features/shop/controllers/brand_controller.dart';
import 'package:winter_store/features/shop/models/brand_model.dart';
import 'package:winter_store/features/shop/models/cagegory_model.dart';
import 'package:winter_store/features/shop/models/product_model.dart';
import 'package:winter_store/utils/helpers/network_help_functions.dart';

class CategoryBrands extends StatelessWidget {
  const CategoryBrands({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return FutureBuilder<List<BrandModel>>(
        future: controller.getBrandsByCategoryId(category.id),
        builder: (_, snapshot) {
          final widget =
              NetworkHelpFunctions.checkMultuRecordState(snapshot: snapshot);

          if (widget != null) return widget;

          final brands = snapshot.data as List<BrandModel>;

          if (brands.isEmpty) {
            return const Center(
              child: Text('No brands found'),
            );
          }
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: brands.length,
            itemBuilder: (_, index) {
              final brand = brands[index];
              return FutureBuilder<List<ProductModel>>(
                  future:
                      controller.getBrandProducts(brandId: brand.id, limit: 3),
                  builder: (_, snapshot) {
                    final widget = NetworkHelpFunctions.checkMultuRecordState(
                        snapshot: snapshot);

                    if (widget != null) return widget;

                    final products = snapshot.data!;

                    return BrandShowCase(
                        images: products.map((e) => e.thumbnail).toList(),
                        brand: brand);
                  });
            },
          );
        });
  }
}
