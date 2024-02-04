import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:winter_store/commons/widgets/appbar/appbar.dart';
import 'package:winter_store/commons/widgets/texts/section_heading.dart';
import 'package:winter_store/features/shop/controllers/banner_controller.dart';
import 'package:winter_store/features/shop/controllers/brand_controller.dart';
import 'package:winter_store/features/shop/controllers/categories_controller.dart';
import 'package:winter_store/features/shop/controllers/product_controller.dart';
import 'package:winter_store/utils/constants/sizes.dart';

class UploadDataScreen extends StatelessWidget {
  const UploadDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categoriesController = CategoriesController.instance;
    final bannerController = BannerController.instance;
    final productController = ProductController.instance;
    final brandController = Get.put(BrandController());
    return Scaffold(
      appBar: WAppBar(
        showBackArrow: true,
        title: const Text('Upload Data'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(children: [
            // Main Record
            UploadDataItem(
              title: 'Main Record',
              children: [
                ListTile(
                  leading: Icon(
                    Iconsax.category,
                    color: Theme.of(context).primaryColor,
                  ),
                  title: const Text('Upload Categories'),
                  trailing: Icon(
                    Iconsax.arrow_up_1,
                    color: Theme.of(context).primaryColor,
                  ),
                  onTap: () => categoriesController.uploadAllCategories(),
                ),
                ListTile(
                  leading: Icon(
                    Iconsax.shop,
                    color: Theme.of(context).primaryColor,
                  ),
                  title: const Text('Upload Brands'),
                  trailing: Icon(
                    Iconsax.arrow_up_1,
                    color: Theme.of(context).primaryColor,
                  ),
                  onTap: () => brandController.uploadAllBrands(),
                ),
                ListTile(
                  leading: Icon(
                    Icons.production_quantity_limits_sharp,
                    color: Theme.of(context).primaryColor,
                  ),
                  title: const Text('Upload Products'),
                  trailing: Icon(
                    Iconsax.arrow_up_1,
                    color: Theme.of(context).primaryColor,
                  ),
                  onTap: () => productController.uploadAllProducts(),
                ),
                ListTile(
                  leading: Icon(
                    Iconsax.image,
                    color: Theme.of(context).primaryColor,
                  ),
                  title: const Text('Upload Banners'),
                  trailing: Icon(
                    Iconsax.arrow_up_1,
                    color: Theme.of(context).primaryColor,
                  ),
                  onTap: () => bannerController.uploadAllBanners(),
                ),
              ],
            ),
            // Relationships
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            UploadDataItem(
              title: 'Relationships',
              subTitle:
                  'Make sure you have all alreadt uploaded all the content above',
              children: [
                ListTile(
                  leading: Icon(
                    Icons.real_estate_agent_outlined,
                    color: Theme.of(context).primaryColor,
                  ),
                  title: const Text('Upload Brands & Categories relation Data'),
                  trailing: Icon(
                    Iconsax.arrow_up_1,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Iconsax.image,
                    color: Theme.of(context).primaryColor,
                  ),
                  title: const Text('Upload Product Categories relation Data'),
                  trailing: Icon(
                    Iconsax.arrow_up_1,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }
}

class UploadDataItem extends StatelessWidget {
  const UploadDataItem({
    super.key,
    required this.title,
    required this.children,
    this.subTitle,
  });

  final String title;
  final String? subTitle;
  final Iterable<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SectionHeading(
        title: title,
        showActionButton: false,
      ),
      if (subTitle != null)
        Text(
          subTitle!,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      const SizedBox(
        height: TSizes.spaceBtwItems,
      ),
      Column(children: children.map((e) => e).toList())
    ]);
  }
}
