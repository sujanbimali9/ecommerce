import 'package:ecommerce_flutter/common/widgets/widgets.login_signup/form_divider.dart';
import 'package:ecommerce_flutter/common/widgets/widgets.login_signup/social_button.dart';
import 'package:ecommerce_flutter/features/authentication/controllers/login_controller.dart';
import 'package:ecommerce_flutter/features/authentication/screens/login/widgets/login_form.dart';
import 'package:ecommerce_flutter/features/authentication/screens/login/widgets/login_header.dart';
import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:ecommerce_flutter/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TLoginHeader(),
            TLoginForm(),
            TFormDivider(dividerText: TTexts.orSignInWith),
            SizedBox(height: TSizes.spaceBtwItems / 2),
            TSocialButton()
          ],
        ),
      ),
    );
  }
}
