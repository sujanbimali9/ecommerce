import 'package:ecommerce_flutter/common/widgets/app_bar/custom_appbar.dart';
import 'package:ecommerce_flutter/common/widgets/products/sortable/sortable_product.dart';
import 'package:ecommerce_flutter/common/widgets/shimmer_effect/vertical_product_shimmer.dart';
import 'package:ecommerce_flutter/features/shop/controllers/product/allproductcontroller.dart';
import 'package:ecommerce_flutter/features/shop/models/product_model.dart';
import 'package:ecommerce_flutter/utils/constants/sizes.dart';
import 'package:firebase_cloud_firestore/firebase_cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllProductScreen extends StatelessWidget {
  const AllProductScreen(
      {super.key, required this.title, this.query, this.future});

  final String title;
  final Query? query;
  final Future<List<ProductModel>>? future;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductController());
    return Scaffold(
      appBar: TAppBar(
          showBackArrow: true,
          title:
              Text(title, style: Theme.of(context).textTheme.headlineMedium)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: FutureBuilder<List<ProductModel>>(
              future: future ?? controller.fetchProductByQuery(query),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const TVerticalProductShimmerEffect();
                }
                if (snapshot.hasData &&
                    snapshot.data != null &&
                    snapshot.data!.isEmpty) {
                  return const Center(
                    child: Text('No data found'),
                  );
                }
                if (snapshot.hasError) {
                  return const Center(
                    child: Text('Error occured'),
                  );
                }
                controller.filteredproduct.assignAll(snapshot.data!);

                return const TSortableProduct();
              }),
        ),
      ),
    );
  }
}
