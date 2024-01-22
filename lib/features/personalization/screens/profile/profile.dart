import 'package:flutter/material.dart';
import 'package:winter_store/commons/widgets/appbar/appbar.dart';
import 'package:winter_store/commons/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:winter_store/commons/widgets/images/rounded_image.dart';
import 'package:winter_store/commons/widgets/texts/section_heading.dart';
import 'package:winter_store/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:winter_store/utils/constants/image_strings.dart';
import 'package:winter_store/utils/constants/sizes.dart';
import 'package:winter_store/utils/constants/text_strings.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                    const RoundedImage(
                      imageUrl: TImages.user,
                      width: 80,
                      height: 80,
                    ),
                    TextButton(
                      onPressed: () {},
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
                text: "Coding with Winter",
                onPressed: () {},
              ),
              ProfileMenu(
                title: "UserName",
                text: "code_with_winter",
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
                text: "07122003",
                onPressed: () {},
              ),
              ProfileMenu(
                title: "E-mail",
                text: "winter@winter.com",
                onPressed: () {},
              ),
              ProfileMenu(
                title: "Phone Number",
                text: "+84-086-3339999",
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
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (_) {
                            return RoundedContainer(
                              padding: EdgeInsets.all(TSizes.md),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Confirm',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge,
                                    ),
                                    const SizedBox(
                                      height: TSizes.spaceBtwItems,
                                    ),
                                  ]),
                            );
                          });
                    },
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
