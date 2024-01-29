import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:winter_store/commons/widgets/custom_shapes/containers/circular_container.dart';
import 'package:winter_store/commons/widgets/images/rounded_image.dart';
import 'package:winter_store/commons/widgets/shimmer/shimmer_effect.dart';
import 'package:winter_store/features/shop/controllers/banner_controller.dart';
import 'package:winter_store/utils/constants/colors.dart';
import 'package:winter_store/utils/constants/sizes.dart';

class PromoSlider extends StatelessWidget {
  const PromoSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BannerController());
    return Obx(() {
      if (controller.isLoading.value) {
        return const ShimmerEffect(width: double.infinity, height: 190);
      }

      if (controller.banners.isEmpty) {
        return Center(
          child: Text("No banners found"),
        );
      }

      return Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(
                viewportFraction: 1,
                onPageChanged: (index, _) {
                  controller.updatePageIndicator(index);
                }),
            items: controller.banners
                .map((banner) => RoundedImage(
                    isNetworkImage: true,
                    imageUrl: banner.imageUrl,
                    applyImageRadius: true,
                    onPressed: () => Get.toNamed(banner.targetScreen)))
                .toList(),
          ),
          const SizedBox(
            height: TSizes.spaceBtwItems,
          ),
          Center(
            child: Obx(
              () => Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (int i = 0; i < controller.banners.length; i++)
                    CircularContainer(
                      width: 20,
                      height: 4,
                      margin: const EdgeInsets.only(right: 10),
                      backgroundColor:
                          controller.carouselCurrentIndex.value == i
                              ? TColors.primary
                              : TColors.grey,
                    ),
                ],
              ),
            ),
          )
        ],
      );
    });
  }
}
