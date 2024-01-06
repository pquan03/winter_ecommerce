import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:winter_store/commons/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:winter_store/utils/constants/colors.dart';
import 'package:winter_store/utils/constants/sizes.dart';
import 'package:winter_store/utils/helpers/helper_functions.dart';

class SingleAddress extends StatelessWidget {
  const SingleAddress({super.key, required this.isSelected});

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      width: double.infinity,
      showBorder: true,
      backgroundColor: isSelected ? TColors.primary.withOpacity(0.5) : null,
      borderColor: isSelected
          ? Colors.transparent
          : THelperFunctions.isDarkMode(context)
              ? TColors.darkerGrey
              : TColors.grey,
      margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
      child: Padding(
        padding: const EdgeInsets.all(TSizes.md),
        child: Stack(
          children: [
            Positioned(
                top: 0,
                right: 5,
                child: Icon(
                  isSelected ? Iconsax.tick_circle5 : null,
                  color: THelperFunctions.isDarkMode(context)
                      ? TColors.light
                      : TColors.dark,
                )),
            Column(
              children: [
                // individual
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Coding with Winter',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        Text(
                          '+84867333697',
                          style: Theme.of(context).textTheme.bodyLarge,
                        )
                      ],
                    ),
                  ],
                ),

                Text('84 Tan Trieu, Thanh Tri district, Ha Noi captial, VN'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
