import 'dart:async';

import 'package:ecommerce_flutter/data/repositories/authentication/authentication_repository.dart';
import 'package:ecommerce_flutter/features/authentication/screens/login/login_screen.dart';
import 'package:ecommerce_flutter/features/authentication/screens/signup/signup_success_screen.dart';
import 'package:ecommerce_flutter/utils/popups/loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();
  final repository = AuthenticaitonRepository.instance;

  @override
  void onInit() {
    sendEmailVerification();
    checkEmailVerified();
    super.onInit();
  }

  void checkEmailVerified() async {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      FirebaseAuth.instance.currentUser?.reload();
      if (FirebaseAuth.instance.currentUser?.emailVerified ?? false) {
        timer.cancel();
        Get.off(() => const SignUpSuccessScreen());
      }
    });
  }

  void sendEmailVerification() async {
    try {
      await repository.sendEmailVerification();
    } catch (e) {
      TLoaders.errorSnackBar(title: 'error occured', message: e.toString());
    }
  }

  Future<void> checkEmailVerificaitonStatus() async {
    FirebaseAuth.instance.currentUser?.emailVerified ?? false
        ? Get.offAll(() => const LoginScreen())
        : null;
  }
}
