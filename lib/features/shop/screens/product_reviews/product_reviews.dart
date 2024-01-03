import 'package:flutter/material.dart';
import 'package:t_store/commons/widgets/appbar/appbar.dart';
import 'package:t_store/features/shop/screens/product_reviews/widgets/overall_product_rating.dart';
import 'package:t_store/features/shop/screens/product_reviews/widgets/rating_bar_indicator.dart';
import 'package:t_store/features/shop/screens/product_reviews/widgets/user_review_card.dart';
import 'package:t_store/utils/constants/sizes.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // App bar
      appBar: WAppBar(
        title: Text('Reviews & Ratings'),
        showBackArrow: true,
      ),

      // Body
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                  'Ratings and reviews are verified and are from people who use the same type of device that you use.'),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              // Overall Product Ratings
              WOverallProductRating(),

              // Ratting stars
              WRatingBarIndicator(
                rating: 3.5,
              ),
              Text(
                "12,0703",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              // User Review List
              UserReviewCard(),
              UserReviewCard(),
              UserReviewCard(),
            ],
          ),
        ),
      ),
    );
  }
}
