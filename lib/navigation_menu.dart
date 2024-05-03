import 'package:ecommerce_flutter/features/personalization/screens/setting_screen/setting_screen.dart';
import 'package:ecommerce_flutter/features/shop/screens/favourite/wishlist_screen.dart';
import 'package:ecommerce_flutter/features/shop/screens/home/home_screen.dart';
import 'package:ecommerce_flutter/features/shop/screens/shop/shop_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TNavigationmenu extends StatelessWidget {
  const TNavigationmenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigatorMenuControler());
    return Scaffold(
      body: Obx(() {
        return IndexedStack(
          index: controller.index.value,
          children: controller.screen,
        );
      }),
      bottomNavigationBar: Obx(() {
        return NavigationBar(
            height: 60,
            elevation: 0,
            selectedIndex: controller.index.value,
            onDestinationSelected: (value) => controller.index.value = value,
            destinations: const [
              NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
              NavigationDestination(icon: Icon(Iconsax.shop), label: 'Shop'),
              NavigationDestination(
                  icon: Icon(Iconsax.heart), label: 'Wishlist'),
              NavigationDestination(icon: Icon(Iconsax.home), label: 'Profile'),
            ]);
      }),
    );
  }
}

class NavigatorMenuControler extends GetxController {
  Rx<int> index = 0.obs;
  final List<Widget> screen = const [
    HomeScreen(),
    // StoreScreen(),
    // WishlistScreen(),
    SizedBox(),
    SizedBox(),
    SettingScreen(),
  ];
}
