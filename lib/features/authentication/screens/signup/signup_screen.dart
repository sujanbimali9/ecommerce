import 'package:ecommerce_flutter/common/widgets/widgets.login_signup/form_divider.dart';
import 'package:ecommerce_flutter/common/widgets/widgets.login_signup/social_button.dart';
import 'package:ecommerce_flutter/features/authentication/controllers/sign_up_controller.dart';
import 'package:ecommerce_flutter/features/authentication/screens/signup/widgets/sign_up_form.dart';
import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:ecommerce_flutter/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpController());
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Text(
            TTexts.signupTitle,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const SizedBox(height: TSizes.spaceBtwSections),
          const TSignUpForm(),
          const SizedBox(height: TSizes.spaceBtwSections),
          const TFormDivider(dividerText: TTexts.orSignUpWith),
          const SizedBox(height: TSizes.spaceBtwItems),
          const TSocialButton(),
        ],
      )),
    );
  }
}
