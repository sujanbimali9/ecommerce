import 'package:ecommerce_flutter/data/repositories/authentication/authentication_repository.dart';
import 'package:ecommerce_flutter/features/authentication/screens/password_configuration/reset_password_screen.dart';
import 'package:ecommerce_flutter/utils/constants/image_strings.dart';
import 'package:ecommerce_flutter/utils/helpers/network_manager.dart';
import 'package:ecommerce_flutter/utils/popups/full_screen_loader.dart';
import 'package:ecommerce_flutter/utils/popups/loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> forgetPassword() async {
    TFullScreenLoader.openLoadingDialog('loading please wait', TImages.loading);

    if (!(await NetworkManager.instance.isConnected())) {
      TFullScreenLoader.removeLoader();
      return;
    }
    try {
      if (formKey.currentState!.validate()) {
        AuthenticaitonRepository.instance
            .resetPasword(emailController.text.trim());
      }
      Get.to(() => const ResetPasswordScreen());
    } catch (e) {
      TFullScreenLoader.removeLoader();

      TLoaders.errorSnackBar(title: 'error occured', message: e.toString());
    }
  }

  Future<void> resendResetEmail() async {
    if (!(await NetworkManager.instance.isConnected())) {
      return;
    }
    try {
      await AuthenticaitonRepository.instance
          .resetPasword(emailController.text.trim());
      TLoaders.successSnackBar(
          title: 'reset email Sent', message: 'Check your inbox');
    } catch (e) {
      TLoaders.errorSnackBar(title: 'error occured', message: e.toString());
    }
  }
}
