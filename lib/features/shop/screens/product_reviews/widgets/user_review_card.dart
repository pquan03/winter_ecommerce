import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:winter_store/commons/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:winter_store/features/shop/screens/product_reviews/widgets/rating_bar_indicator.dart';
import 'package:winter_store/utils/constants/colors.dart';
import 'package:winter_store/utils/constants/image_strings.dart';
import 'package:winter_store/utils/constants/sizes.dart';
import 'package:winter_store/utils/helpers/helper_functions.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // User info
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(TImages.userProfileImage1),
                ),
                const SizedBox(
                  width: TSizes.spaceBtwItems,
                ),
                Text(
                  "Winter Phan",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
          ],
        ),

        // Review
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),

        // rating stars and date
        Row(
          children: [
            WRatingBarIndicator(
              rating: 4.5,
            ),
            const SizedBox(
              width: TSizes.spaceBtwItems,
            ),
            Text(
              '07-Dec-2003',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),

        // Content Review
        ReadMoreText(
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries',
          trimLines: 2,
          trimMode: TrimMode.Line,
          moreStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: TColors.primary),
          lessStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: TColors.primary),
        ),

        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),

        RoundedContainer(
          backgroundColor: THelperFunctions.isDarkMode(context)
              ? TColors.darkerGrey
              : TColors.grey,
          child: Padding(
            padding: const EdgeInsets.all(TSizes.md),
            child: Column(
              children: [
                // Shop info
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "W's Store",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      '07-Dec-2003',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),

                // Reply content

                ReadMoreText(
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries',
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  moreStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: TColors.primary),
                  lessStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: TColors.primary),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),
      ],
    );
  }
}
