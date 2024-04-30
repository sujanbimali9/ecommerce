import 'dart:developer';
import 'dart:io';

import 'package:ecommerce_flutter/data/repositories/authentication/authentication_repository.dart';
import 'package:ecommerce_flutter/features/authentication/models/user_model.dart';
import 'package:ecommerce_flutter/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:ecommerce_flutter/utils/exceptions/firebase_exceptions.dart';
import 'package:ecommerce_flutter/utils/exceptions/format_exceptions.dart';
import 'package:ecommerce_flutter/utils/exceptions/platform_exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_cloud_firestore/firebase_cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UserRepository extends GetxController {
  static UserRepository instance = Get.find();
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<bool> userExits(String userId) async {
    try {
      return (await _db.collection('users').doc(userId).get()).exists;
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (e) {
      throw TFormatException(e.message).message;
    } on TPlatformException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    }
  }

  Future<void> saveNewUser(UserModel user) async {
    try {
      _db.collection('users').doc(user.id).set(user.toJson());
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (e) {
      throw TFormatException(e.message).message;
    } on TPlatformException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    }
  }

  Future<UserModel> getUser() async {
    try {
      final res = await _db
          .collection('users')
          .doc(AuthenticaitonRepository.instance.user?.uid)
          .get();

      return res.data() != null
          ? UserModel.fromJson(res.data()!)
          : UserModel.empty;
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (e) {
      throw TFormatException(e.message).message;
    } on TPlatformException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    }
  }

  Future<void> updateUser(UserModel user) async {
    try {
      await _db.collection('users').doc(user.id).update(user.toJson());
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (e) {
      throw TFormatException(e.message).message;
    } on TPlatformException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    }
  }

  Future<void> updateSingleField(Map<String, dynamic> json) async {
    try {
      await _db
          .collection('users')
          .doc(AuthenticaitonRepository.instance.user?.uid)
          .update(json);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (e) {
      throw TFormatException(e.message).message;
    } on TPlatformException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    }
  }

  Future<void> deleteUserData() async {
    try {
      await _db
          .collection('users')
          .doc(AuthenticaitonRepository.instance.user?.uid)
          .delete();
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (e) {
      throw TFormatException(e.message).message;
    } on TPlatformException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    }
  }

  Future<String> uploadImage(String firebasePath, XFile image) async {
    try {
      final storage = FirebaseStorage.instance;
      final ref = storage.ref(firebasePath).child(image.name);
      await ref.putFile(File(image.path));
      final url = await ref.getDownloadURL();
      log(url);
      return url;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (e) {
      throw TFormatException(e.message).message;
    } on TPlatformException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    }
  }
}
