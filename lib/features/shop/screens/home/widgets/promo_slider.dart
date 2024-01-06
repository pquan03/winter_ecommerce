import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:winter_store/commons/widgets/custom_shapes/containers/circular_container.dart';
import 'package:winter_store/commons/widgets/images/rounded_image.dart';
import 'package:winter_store/features/shop/controllers/home_controller.dart';
import 'package:winter_store/utils/constants/colors.dart';
import 'package:winter_store/utils/constants/sizes.dart';

class PromoSlider extends StatelessWidget {
  const PromoSlider({
    super.key,
    required this.banners,
  });

  final List<String> banners;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              viewportFraction: 1,
              onPageChanged: (index, _) {
                controller.updatePageIndicator(index);
              }),
          items: banners.map((url) => RoundedImage(imageUrl: url)).toList(),
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        Center(
          child: Obx(
            () => Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (int i = 0; i < 3; i++)
                  CircularContainer(
                    width: 20,
                    height: 4,
                    margin: const EdgeInsets.only(right: 10),
                    backgroundColor: controller.carouselCurrentIndex.value == i
                        ? TColors.primary
                        : TColors.grey,
                  ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
