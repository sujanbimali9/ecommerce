import 'package:carousel_slider/carousel_controller.dart';
import 'package:ecommerce_flutter/data/repositories/banner/banner_repository.dart';
import 'package:ecommerce_flutter/features/shop/models/banner_model.dart';
import 'package:ecommerce_flutter/utils/popups/loader.dart';
import 'package:get/get.dart';

class BannerController extends GetxController {
  static BannerController get instance => Get.find();
  var currentIndex = 0.obs;
  CarouselController carouselController = CarouselController();
  final _bannerRepository = Get.put(BannerRepository());
  final RxList<BannerModel> allBanners = <BannerModel>[].obs;
  @override
  void onInit() {
    fetchBanner();
    super.onInit();
  }

  final isLoading = false.obs;
  void updateCurrentIndex(int index) {
    currentIndex.value = index;
  }

  void onDotClick(int index) {
    currentIndex.value = index;
    carouselController.animateToPage(index);
  }

  Future<void> fetchBanner() async {
    try {
      isLoading.value = true;
      final banners = await _bannerRepository.getAllBanner();
      allBanners.assignAll(banners);
    } catch (e) {
      TLoaders.errorSnackBar(title: 'error occured', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
