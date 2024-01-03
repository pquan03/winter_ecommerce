
import 'package:flutter/material.dart';

class WBillingAmountSection extends StatelessWidget {
  const WBillingAmountSection(
      {super.key,
      required this.title,
      required this.price,
      this.currencySign = '\$'});

  final String title, price, currencySign;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        Text(currencySign + price,
            style: Theme.of(context).textTheme.bodyMedium)
      ],
    );
  }
}
