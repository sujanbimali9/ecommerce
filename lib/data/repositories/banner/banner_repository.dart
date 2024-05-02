import 'package:ecommerce_flutter/features/shop/models/banner_model.dart';
import 'package:ecommerce_flutter/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:ecommerce_flutter/utils/exceptions/firebase_exceptions.dart';
import 'package:ecommerce_flutter/utils/exceptions/format_exceptions.dart';
import 'package:ecommerce_flutter/utils/exceptions/platform_exceptions.dart';
import 'package:firebase_cloud_firestore/firebase_cloud_firestore.dart';
import 'package:get/get.dart';

class BannerRepository extends GetxController {
  static BannerRepository get instance => Get.find();
  final _db = FirebaseFirestore.instance;

  Future<List<BannerModel>> getAllBanner() async {
    try {
      final res = await _db.collection('Banners').get();
      final list = res.docs
          .map((category) => BannerModel.fromJson(category.data()))
          .toList();
      return list;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (e) {
      throw TFormatException(e.message).message;
    } on TPlatformException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } catch (e) {
      throw e.toString();
    }
  }
}
