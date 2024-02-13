import 'package:flutter/material.dart';
import 'package:winter_store/commons/widgets/appbar/appbar.dart';
import 'package:winter_store/commons/widgets/images/rounded_image.dart';
import 'package:winter_store/features/shop/controllers/categories_controller.dart';
import 'package:winter_store/features/shop/models/cagegory_model.dart';
import 'package:winter_store/features/shop/screens/sub_category/widgets/list_product_horizontal.dart';
import 'package:winter_store/utils/constants/image_strings.dart';
import 'package:winter_store/utils/constants/sizes.dart';
import 'package:winter_store/utils/helpers/network_help_functions.dart';

class SubCategoryScreen extends StatelessWidget {
  const SubCategoryScreen({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoriesController.instance;
    return Scaffold(
      // App bar
      appBar: WAppBar(
        title: Text(category.name),
        showBackArrow: true,
      ),
      // body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              // Image
              RoundedImage(
                imageUrl: TImages.banner3,
                applyImageRadius: true,
                width: double.infinity,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              // Sports Equipments
              FutureBuilder(
                  future: controller.getSubCategories(category.id),
                  builder: (_, snapshot) {
                    final widget = NetworkHelpFunctions.checkMultuRecordState(
                        snapshot: snapshot);
                    if (widget != null) {
                      return widget;
                    }

                    final listSubCategory = snapshot.data!;

                    return ListView.separated(
                      itemCount: listSubCategory.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      separatorBuilder: (_, __) => const SizedBox(
                        height: TSizes.spaceBtwItems,
                      ),
                      itemBuilder: (_, index) {
                        final subCategory = listSubCategory[index];
                        return SubCategorySection(
                          category: subCategory,
                        );
                      },
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
