import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:winter_store/commons/widgets/images/rounded_image.dart';
import 'package:winter_store/features/personalization/controllers/user_controller.dart';
import 'package:winter_store/features/personalization/screens/profile/profile.dart';
import 'package:winter_store/utils/constants/colors.dart';
import 'package:winter_store/utils/constants/image_strings.dart';

class UserProfileTile extends StatelessWidget {
  const UserProfileTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return ListTile(
      leading: Obx(() {
        final networkImage = controller.user.value.profilePicture;
        final image = networkImage.isEmpty ? TImages.user : networkImage;
        final isNetworkImage = networkImage.isNotEmpty;
        return RoundedImage(
          isNetworkImage: isNetworkImage,
          applyImageRadius: true,
          imageUrl: image,
          width: 80,
          height: 80,
        );
      }),
      title: Text(
        controller.user.value.fullName,
        style: Theme.of(context)
            .textTheme
            .headlineSmall!
            .apply(color: TColors.white),
      ),
      subtitle: Text(
        controller.user.value.email,
        style:
            Theme.of(context).textTheme.bodyMedium!.apply(color: TColors.white),
      ),
      trailing: IconButton(
          onPressed: () => Get.to(() => const ProfileScreen()),
          icon: Icon(
            Iconsax.edit,
            color: TColors.white,
          )),
    );
  }
}
