import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get instance => Get.find();
  var currentIndex = 0.obs;
  CarouselController carouselController = CarouselController();

  void updateCurrentIndex(int index) {
    currentIndex.value = index;
  }

  void onDotClick(int index) {
    currentIndex.value = index;
    carouselController.animateToPage(index);
  }
}
