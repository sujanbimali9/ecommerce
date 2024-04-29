import 'package:ecommerce_flutter/features/authentication/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  final PageController pageController = PageController();
  var currentPageIndex = 0.obs;

  void updatePageIndicator(int index) => currentPageIndex.value = index;

  void dotClick(int index) {
    currentPageIndex.value = index;
    pageController.jumpToPage(index);
  }

  void skipPage() {
    currentPageIndex.value = 2;
    pageController.jumpToPage(2);
  }

  void nextPage() {
    if (currentPageIndex.value == 2) {
      final storage = GetStorage();
      storage.write('isFirstTime', false);
      Get.offAll(() => const LoginScreen());
    } else {
      currentPageIndex = currentPageIndex + 1;
      pageController.nextPage(
          duration: const Duration(milliseconds: 500), curve: Curves.linear);
    }
  }
}
