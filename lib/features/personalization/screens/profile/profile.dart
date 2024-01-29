import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:winter_store/commons/widgets/appbar/appbar.dart';
import 'package:winter_store/commons/widgets/images/rounded_image.dart';
import 'package:winter_store/commons/widgets/texts/section_heading.dart';
import 'package:winter_store/features/personalization/controllers/user_controller.dart';
import 'package:winter_store/features/personalization/screens/profile/widgets/change_name.dart';
import 'package:winter_store/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:winter_store/utils/constants/image_strings.dart';
import 'package:winter_store/utils/constants/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: WAppBar(
        title: const Text("Profile"),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              // Profile picture
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Obx(() {
                      final networkImage = controller.user.value.profilePicture;
                      final image =
                          networkImage.isEmpty ? TImages.user : networkImage;
                      final isNetworkImage = networkImage.isNotEmpty;
                      return RoundedImage(
                        isNetworkImage: isNetworkImage,
                        applyImageRadius: true,
                        imageUrl: image,
                        width: 80,
                        height: 80,
                        borderRadius: 100,
                      );
                    }),
                    TextButton(
                      onPressed: () => controller.uploadUserProfilePicture(),
                      child: const Text("Change Profile Picture"),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems / 2,
              ),
              const Divider(),
              const SizedBox(
                height: TSizes.spaceBtwItems / 2,
              ),

              // Profile information
              SectionHeading(
                title: "Profile information",
                showActionButton: false,
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              ProfileMenu(
                title: "Name",
                text: controller.user.value.fullName,
                onPressed: () => Get.to(() => const ChangeNameScreen()),
              ),
              ProfileMenu(
                title: "UserName",
                text: controller.user.value.username,
                onPressed: () {},
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems / 2,
              ),
              const Divider(),
              const SizedBox(
                height: TSizes.spaceBtwItems / 2,
              ),

              // Personal information
              SectionHeading(
                title: "Personal information",
                showActionButton: false,
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              ProfileMenu(
                title: "User ID",
                text: controller.user.value.id,
                onPressed: () {},
              ),
              ProfileMenu(
                title: "E-mail",
                text: controller.user.value.email,
                onPressed: () {},
              ),
              ProfileMenu(
                title: "Phone Number",
                text: controller.user.value.phoneNumber,
                onPressed: () {},
              ),
              ProfileMenu(
                title: "Gender",
                text: "Female",
                onPressed: () {},
              ),
              ProfileMenu(
                title: "Date of birth",
                text: "07 Dec, 2003",
                onPressed: () {},
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems / 2,
              ),
              const Divider(),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              Center(
                child: TextButton(
                    onPressed: () => controller.deleteAccountWarningPopup(),
                    child: Text(
                      "Close Account",
                      style: Theme.of(context).textTheme.bodyMedium!.apply(
                            color: Colors.red,
                          ),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
