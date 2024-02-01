import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:winter_store/features/shop/models/product_model.dart';
import 'package:winter_store/utils/constants/sizes.dart';

class ImagesController extends GetxController {
  // Singleton
  static ImagesController get instance => Get.find();

  // Variables
  RxString selectedProductImage = ''.obs;

  // Get all product images
  List<String> getAllProductImages(ProductModel product) {
    Set<String> images = {};

    // Load thumbnail
    images.add(product.thumbnail);

    // Assign thumbnail to selected image
    selectedProductImage.value = product.thumbnail;

    if (product.images != null) {
      images.addAll(product.images!);
    }

    if (product.productVariations != null ||
        product.productVariations!.isNotEmpty) {
      product.productVariations!.map((e) {
        images.add(e.image!);
      }).toList();
    }

    return images.toList();
  }

  /// -- Show Image Popup
  void showEnlargedImage(String image) {
    Get.to(
        fullscreenDialog: true,
        () => Dialog.fullscreen(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: TSizes.defaultSpace * 2,
                          horizontal: TSizes.defaultSpace),
                      child: CachedNetworkImage(imageUrl: image),
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwSections,
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: SizedBox(
                        width: 150,
                        child: OutlinedButton(
                            onPressed: () => Get.back(),
                            child: const Text('Close')),
                      ),
                    )
                  ]),
            ));
  }
}
