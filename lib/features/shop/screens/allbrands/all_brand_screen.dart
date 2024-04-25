import 'package:ecommerce_flutter/common/widgets/app_bar/custom_appbar.dart';
import 'package:ecommerce_flutter/common/widgets/brand/brand_card.dart';
import 'package:ecommerce_flutter/common/widgets/layout/grid_layout.dart';
import 'package:ecommerce_flutter/features/shop/screens/allproduct/brand_product_screen.dart';
import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllBrandScreen extends StatelessWidget {
  const AllBrandScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text('Brand', style: Theme.of(context).textTheme.headlineMedium),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: TGridLayout(
            itemCount: 50,
            crossAxisCount: 2,
            mainAxisExtents: 80,
            itemBuilder: (context, index) => TBrandCard(
              brand: 'Nike',
              noOfProducts: '256 Products',
              showBorder: true,
              onPressed: () => Get.to(() => const BrandProductScreen()),
            ),
          ),
        ),
      ),
    );
  }
}
