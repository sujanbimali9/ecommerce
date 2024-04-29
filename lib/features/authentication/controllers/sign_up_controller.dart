import 'dart:developer';

import 'package:ecommerce_flutter/data/repositories/authentication/authentication_repository.dart';
import 'package:ecommerce_flutter/data/repositories/user/user_repository.dart';
import 'package:ecommerce_flutter/features/authentication/models/user_model.dart';
import 'package:ecommerce_flutter/features/authentication/screens/signup/signup_verify_screen.dart';
import 'package:ecommerce_flutter/utils/constants/image_strings.dart';
import 'package:ecommerce_flutter/utils/helpers/network_manager.dart';
import 'package:ecommerce_flutter/utils/popups/full_screen_loader.dart';
import 'package:ecommerce_flutter/utils/popups/loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  var hidePassword = true.obs;
  var termsandConditions = false.obs;

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userName = TextEditingController();
  final email = TextEditingController();
  final phoneNo = TextEditingController();
  final password = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> signUp() async {
    if (!await NetworkManager.instance.isConnected()) {
      return;
    }

    if (formKey.currentState!.validate() && termsandConditions.value) {
      try {
        TFullScreenLoader.openLoadingDialog(
          'Please wait we are processing your information',
          TImages.loading,
        );

        final UserCredential userCredential =
            await AuthenticaitonRepository.instance.signUpWithEmailAndPassword(
                email.text.trim(), password.text.trim());

        final user = UserModel(
            id: userCredential.user!.uid,
            email: email.text.trim(),
            firstName: firstName.text.trim(),
            lastName: lastName.text.trim(),
            phoneNo: phoneNo.text.trim(),
            profilePicture: TImages.userProfileImage3,
            userName: userName.text.trim());

        final userRepository = Get.put(UserRepository());
        await userRepository.saveNewUser(user);

        TFullScreenLoader.removeLoader();
        Get.to(() => SignUpVerifyScreen(email: user.email));
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
