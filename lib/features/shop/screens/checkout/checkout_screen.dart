import 'package:ecommerce_flutter/common/widgets/app_bar/custom_appbar.dart';
import 'package:ecommerce_flutter/common/widgets/custom_shapes/container/circle_container.dart';
import 'package:ecommerce_flutter/common/widgets/products/cart/cart_items_builder.dart';
import 'package:ecommerce_flutter/common/widgets/products/cart/coupons_widgets.dart';
import 'package:ecommerce_flutter/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:ecommerce_flutter/features/shop/screens/checkout/widgets/billling_payment_selection.dart';
import 'package:ecommerce_flutter/features/shop/screens/checkout/widgets/shipping_address_selection.dart';
import 'package:ecommerce_flutter/features/shop/screens/payment/payment_success.dart';
import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:ecommerce_flutter/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(
          'Order Review',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: TSizes.defaultSpace,
            vertical: TSizes.spaceBtwItems / 2),
        child: ElevatedButton(
            onPressed: () => Get.to(() => const PaymentSuccessScreen()),
            child: const Text('Proceed to Payment')),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              TCartItemBuilder(
                showAddRemoveButton: false,
                itemCount: 2,
              ),
              SizedBox(height: TSizes.spaceBtwSections),
              TCouponsCode(),
              SizedBox(height: TSizes.spaceBtwSections),
              TRoundedContainer(
                showBorder: true,
                radius: TSizes.cardRadiusLg,
                padding: EdgeInsets.all(TSizes.md),
                child: Column(children: [
                  BillingAmountSelection(),
                  Divider(),
                  SizedBox(height: TSizes.spaceBtwItems / 2),
                  BillingPaymentSection(),
                  SizedBox(height: TSizes.spaceBtwItems / 2),
                  Divider(),
                  SizedBox(height: TSizes.spaceBtwItems / 2),
                  ShippingAddressSelection()
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
