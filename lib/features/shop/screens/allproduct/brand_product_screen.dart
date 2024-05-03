import 'package:ecommerce_flutter/common/widgets/app_bar/custom_appbar.dart';
import 'package:ecommerce_flutter/common/widgets/brand/brand_card.dart';
import 'package:ecommerce_flutter/common/widgets/products/sortable/sortable_product.dart';
import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class BrandProductScreen extends StatelessWidget {
  const BrandProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text('Nike', style: Theme.of(context).textTheme.headlineMedium),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              TBrandCard(
                brand: 'Nike',
                noOfProducts: '256 products',
                showBorder: true,
              ),
              SizedBox(height: TSizes.spaceBtwSections),
              // TSortableProduct()
            ],
          ),
        ),
      ),
    );
  }
}
