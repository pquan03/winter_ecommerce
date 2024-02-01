import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:winter_store/commons/widgets/appbar/appbar.dart';
import 'package:winter_store/commons/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:winter_store/commons/widgets/custom_shapes/icons/circular_icon.dart';
import 'package:winter_store/commons/widgets/images/rounded_image.dart';
import 'package:winter_store/features/shop/controllers/image_controller.dart';
import 'package:winter_store/features/shop/models/product_model.dart';
import 'package:winter_store/utils/constants/colors.dart';
import 'package:winter_store/utils/constants/sizes.dart';
import 'package:winter_store/utils/helpers/helper_functions.dart';

class ProductImageSlider extends StatelessWidget {
  const ProductImageSlider({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = Get.put(ImagesController());
    final images = controller.getAllProductImages(product);
    return CustomCurvedEdges(
      child: Container(
        color: dark ? TColors.darkerGrey : TColors.light,
        child: Stack(children: [
          // Main Large Image
          SizedBox(
              height: 400,
              child: Padding(
                  padding: const EdgeInsets.all(TSizes.productImageRadius * 2),
                  child: Center(child: Obx(() {
                    final image = controller.selectedProductImage.value;
                    return GestureDetector(
                      onTap: () => controller.showEnlargedImage(image),
                      child: CachedNetworkImage(
                        imageUrl: image,
                        progressIndicatorBuilder: (_, __, downloadProgess) {
                          return CircularProgressIndicator(
                            value: downloadProgess.progress,
                            color: TColors.primary,
                          );
                        },
                      ),
                    );
                  })))),
          // Image slider
          Positioned(
            bottom: 30,
            right: 0,
            child: SizedBox(
              height: 80,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemBuilder: (_, index) => Obx(() {
                        final image = images[index];
                        final isSelected =
                            controller.selectedProductImage.value == image;
                        return RoundedImage(
                            width: 80,
                            backgroundColor:
                                dark ? TColors.dark : TColors.white,
                            padding: const EdgeInsets.all(TSizes.sm),
                            border: isSelected
                                ? Border.all(color: TColors.primary)
                                : null,
                            onPressed: () => controller
                                .selectedProductImage.value = images[index],
                            isNetworkImage: true,
                            imageUrl: image);
                      }),
                  separatorBuilder: (_, index) => const SizedBox(
                        width: TSizes.spaceBtwItems,
                      ),
                  itemCount: images.length),
            ),
          ),
          // Appbar icons
          const WAppBar(
            showBackArrow: true,
            actions: [
              CircularIcon(
                icon: Iconsax.heart5,
                color: Colors.red,
              )
            ],
          )
        ]),
      ),
    );
  }
}
