import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';
import 'package:winter_store/commons/widgets/texts/section_heading.dart';
import 'package:winter_store/features/shop/models/product_model.dart';
import 'package:winter_store/features/shop/screens/product_details/widgets/bottom_add_to_cart_widget.dart';
import 'package:winter_store/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:winter_store/features/shop/screens/product_details/widgets/product_image_slider.dart';
import 'package:winter_store/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:winter_store/features/shop/screens/product_details/widgets/rating_and_share.dart';
import 'package:winter_store/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:winter_store/utils/constants/sizes.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAddToCard(
        product: product,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 1 - Product Image Slider
            ProductImageSlider(
              product: product,
            ),

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
                  ProductMetaData(
                    product: product,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  // Attributes
                  ProductAttributes(
                    product: product,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  // checkout button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {}, child: const Text('Checkout')),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  // description
                  SectionHeading(
                    title: 'Description',
                    showActionButton: false,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  ReadMoreText(
                    product.description!,
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: "Show more",
                    trimExpandedText: "Less",
                    moreStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    lessStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  // reviews
                  const Divider(),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  GestureDetector(
                    onTap: () => Get.to(() => const ProductReviewsScreen()),
                    child: Container(
                      color: Colors.transparent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SectionHeading(
                            title: "Review(199)",
                            showActionButton: false,
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Iconsax.arrow_right_3,
                                size: 18,
                              ))
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
