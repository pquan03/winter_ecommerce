import 'package:flutter/material.dart';
import 'package:t_store/features/shop/screens/product_reviews/widgets/rating_progress_indicator.dart';

class WOverallProductRating extends StatelessWidget {
  const WOverallProductRating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Text(
            "4.8",
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        Expanded(
          flex: 7,
          child: Column(
            children: [
              RatingProgessIndicator(
                rating: '5',
                value: 1,
              ),
              RatingProgessIndicator(
                rating: '4',
                value: 0.8,
              ),
              RatingProgessIndicator(
                rating: '3',
                value: 0.6,
              ),
              RatingProgessIndicator(
                rating: '2',
                value: 0.4,
              ),
              RatingProgessIndicator(
                rating: '1',
                value: 0.2,
              ),
            ],
          ),
        )
      ],
    );
  }
}

