import 'package:flutter/material.dart';
import 'package:winter_store/commons/widgets/appbar/appbar.dart';
import 'package:winter_store/commons/widgets/images/rounded_image.dart';
import 'package:winter_store/features/shop/screens/sub_category/widgets/list_product_horizontal.dart';
import 'package:winter_store/utils/constants/image_strings.dart';
import 'package:winter_store/utils/constants/sizes.dart';

class SubCategoryScreen extends StatelessWidget {
  const SubCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // App bar
      appBar: WAppBar(
        title: const Text('Sports'),
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
              SubCategorySection(
                title: 'Sports Equipments',
              ),
              // Sports Shoes
              SubCategorySection(
                title: 'Sports Shoes',
              ),
              // Track suits
              SubCategorySection(
                title: 'Track suits',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
