import 'package:flutter/material.dart';
import 'package:winter_store/commons/widgets/login_signup/form_diver.dart';
import 'package:winter_store/commons/widgets/login_signup/social_button.dart';
import 'package:winter_store/features/authentication/screens/signup/widget/sign_up_form.dart';
import 'package:winter_store/utils/constants/sizes.dart';
import 'package:winter_store/utils/constants/text_strings.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Text(
                TTexts.signupTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              // Form
              SignUpForm(),
              // Divider
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              FormDivider(
                dividerString: TTexts.orSignUpWith,
              ),
              // Social
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              SocialButton()
            ],
          ),
        ),
      ),
    );
  }
}
