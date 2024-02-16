import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:winter_store/commons/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:winter_store/utils/constants/colors.dart';
import 'package:winter_store/utils/constants/sizes.dart';

class CouponCode extends StatelessWidget {
  const CouponCode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      showBorder: true,
      padding: const EdgeInsets.all(TSizes.sm),
      child: Row(
        children: [
          Expanded(
            child: TextField(
                textCapitalization: TextCapitalization.characters,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.only(left: 10),
                  hintText: 'Enter Coupon Code',
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                )),
          ),
          const SizedBox(
            width: TSizes.spaceBtwItems,
          ),
          SizedBox(
              width: 80,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      side: BorderSide(color: Colors.transparent, width: 0),
                      backgroundColor: TColors.darkerGrey),
                  onPressed: () {},
                  child: const Text('Apply')))
        ],
      ),
    );
  }
}
