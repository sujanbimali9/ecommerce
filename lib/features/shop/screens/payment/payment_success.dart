import 'package:ecommerce_flutter/common/success_screen/success_screen.dart';
import 'package:ecommerce_flutter/navigation_menu.dart';
import 'package:ecommerce_flutter/utils/constants/image_strings.dart';
import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentSuccessScreen extends StatelessWidget {
  const PaymentSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: TSuccessScreen(
              image: TImages.successfulPaymentIcon,
              title: 'Payment Success!',
              subtitle: 'your item will be shipped soon',
              onPressed: () => Get.off(() => const TNavigationmenu())),
        ),
      ),
    );
  }
}
