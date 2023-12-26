import 'package:flutter/material.dart';
import 'package:t_store/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:t_store/features/shop/screens/product_details/widgets/product_image_slider.dart';
import 'package:t_store/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:t_store/features/shop/screens/product_details/widgets/rating_and_share.dart';
import 'package:t_store/utils/constants/sizes.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 1 - Product Image Slider
            ProductImageSlider(),

            // 2 - Product details
            Padding(
              padding: EdgeInsets.only(
                  right: TSizes.defaultSpace,
                  left: TSizes.defaultSpace,
                  bottom: TSizes.defaultSpace),
              child: Column(
                children: [
                  // Rating & Share Button
                  RatingAndShareButton(),

                  // Price, Title, Stock & Brand
                  ProductMetaData(),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  // Attributes
                  ProductAttributes()
                  // checkout button
                  // description
                  // reviews
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
