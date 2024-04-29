import 'dart:developer';

import 'package:ecommerce_flutter/features/personalization/controllers/user_controller.dart';
import 'package:ecommerce_flutter/navigation_menu.dart';
import 'package:ecommerce_flutter/utils/helpers/network_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../data/repositories/authentication/authentication_repository.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/popups/full_screen_loader.dart';
import '../../../utils/popups/loader.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  var hidePassword = true.obs;
  var rememberMe = false.obs;
  final localStorage = GetStorage();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  UserController userController = Get.put(UserController());

  @override
  void onInit() {
    checkRememberMe();
    super.onInit();
  }

  void checkRememberMe() {
    rememberMe.value = localStorage.read<bool?>('rememberMe') ?? false;
    if (rememberMe.value) {
      emailController.text = localStorage.read<String>('email')!;
      passwordController.text = localStorage.read<String>('password')!;
    }
  }

  Future<void> loginWithGoogle() async {
    TFullScreenLoader.openLoadingDialog('logging you in', TImages.loading);
    if (!(await NetworkManager.instance.isConnected())) {
      log('no network');
      TFullScreenLoader.removeLoader();
      return;
    }

    try {
      final UserCredential userCredential =
          await AuthenticaitonRepository.instance.loginWithGoogle();
      log('login success saving data to firebase');
      print(userCredential.user);
      await userController.saveUserData(userCredential);
      TFullScreenLoader.removeLoader();
      Get.offAll(() => const TNavigationmenu());
    } catch (e) {
      TFullScreenLoader.removeLoader();

      TLoaders.errorSnackBar(
        title: e.toString(),
        message: e.toString(),
      );
      log(e.toString());
    }
  }

  Future<void> login() async {
    if (!await NetworkManager.instance.isConnected()) {
      return;
    }

    if (formKey.currentState!.validate()) {
      try {
        TFullScreenLoader.openLoadingDialog(
          'Please wait we are processing your information',
          TImages.loading,
        );
        final UserCredential userCredential =
            await AuthenticaitonRepository.instance.loginWithEmailAndPassword(
                emailController.text.trim(), passwordController.text.trim());

        if (userCredential.user != null) {
          localStorage.write('rememberMe', rememberMe.value);
          if (rememberMe.value) {
            localStorage.write('email', emailController.text);
            localStorage.write('password', passwordController.text);
          }
        }
        TFullScreenLoader.removeLoader();
        Get.offAll(() => const TNavigationmenu());
      } catch (e) {
        TFullScreenLoader.removeLoader();
        TLoaders.errorSnackBar(
          title: 'error occured',
          message: e.toString(),
        );
        log(e.toString());
      }
    }
  }
}
