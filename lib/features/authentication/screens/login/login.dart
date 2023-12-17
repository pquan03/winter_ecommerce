import 'package:flutter/material.dart';
import 'package:t_store/commons/styles/spacing_styles.dart';
import 'package:t_store/commons/widgets/login_signup/form_diver.dart';
import 'package:t_store/commons/widgets/login_signup/social_button.dart';
import 'package:t_store/features/authentication/screens/login/widget/login_form.dart';
import 'package:t_store/features/authentication/screens/login/widget/login_header.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyles.paddingWithAppBarHeight,
          child: Column(
            children: const [
              // Logo, Title & Subtitle
              LoginHeader(),
              // Forme
              LoginForm(),
              // Divider
              FormDivider(
                dividerString: TTexts.orSignInWith,
              ),
              SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              // Footer
              SocialButton()
            ],
          ),
        ),
      ),
    );
  }
}
