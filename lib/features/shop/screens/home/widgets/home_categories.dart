import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:winter_store/commons/widgets/image_text_widgets/vertical_image_text.dart';
import 'package:winter_store/commons/widgets/shimmer/category_shimmer.dart';
import 'package:winter_store/features/shop/controllers/categories_controller.dart';
import 'package:winter_store/features/shop/screens/sub_category/sub_category.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoriesController());
    return Obx(() {
      if (controller.isLoading.value) return const WCategoryShimmer();
      if (controller.featuredCategories.isEmpty) {
        return Center(
            child: Text(
          'No categories found',
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .apply(color: Colors.white),
        ));
      }
      return SizedBox(
        height: 80,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: controller.categories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            final category = controller.categories[index];
            return VerticalImageText(
              image: category.image,
              title: category.name,
              onTap: () => Get.to(() => SubCategoryScreen(
                    category: category,
                  )),
            );
          },
        ),
      );
    });
  }
}
