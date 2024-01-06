import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:winter_store/commons/widgets/image_text_widgets/vertical_image_text.dart';
import 'package:winter_store/features/shop/screens/sub_category/sub_category.dart';
import 'package:winter_store/utils/constants/image_strings.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 6,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          return VerticalImageText(
            image: TImages.shoeIcon,
            title: "Shoes category",
            onTap: () => Get.to(() => const SubCategoryScreen()),
          );
        },
      ),
    );
  }
}
