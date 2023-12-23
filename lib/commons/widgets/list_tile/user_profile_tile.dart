import 'package:flutter/material.dart';
import 'package:t_store/commons/widgets/images/rounded_image.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';

class UserProfileTile extends StatelessWidget {
  const UserProfileTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: RoundedImage(
        imageUrl: TImages.user,
        width: 50,
        height: 50,
        padding: const EdgeInsets.all(0),
      ),
      title: Text(
        "Winte No Snow",
        style: Theme.of(context)
            .textTheme
            .headlineSmall!
            .apply(color: TColors.white),
      ),
      subtitle: Text(
        "winter@winter.com",
        style:
            Theme.of(context).textTheme.bodyMedium!.apply(color: TColors.white),
      ),
    );
  }
}
