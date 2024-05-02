import 'package:ecommerce_flutter/data/repositories/user/user_repository.dart';
import 'package:ecommerce_flutter/features/personalization/controllers/user_controller.dart';
import 'package:ecommerce_flutter/features/personalization/screens/profile/profile_screen.dart';
import 'package:ecommerce_flutter/utils/constants/image_strings.dart';
import 'package:ecommerce_flutter/utils/helpers/network_manager.dart';
import 'package:ecommerce_flutter/utils/popups/full_screen_loader.dart';
import 'package:ecommerce_flutter/utils/popups/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class UpdateNameController extends GetxController {
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = UserRepository.instance;

  @override
  void onInit() {
    initializeName();
    super.onInit();
  }

  void initializeName() {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> updateName() async {
    if (formKey.currentState!.validate()) {
      TFullScreenLoader.openLoadingDialog(
          'we are updating your information', TImages.loading);
      if (!(await NetworkManager.instance.isConnected())) {
        TFullScreenLoader.removeLoader();
        return;
      }

      try {
        await userController.updateSingleField({
          'firstName': firstName.text..trim(),
          'lastName': lastName.text.trim()
        });

        // userController.user.value = userController.user.value.copyWith(
        //     firstName: firstName.text.trim(), lastName: lastName.text.trim());
        userController.user.value.lastName = lastName.text.trim();
        userController.user.value.firstName = firstName.text.trim();

        TFullScreenLoader.removeLoader();
        Get.close(2);
        Get.to(() => const ProfileScreen());
      } catch (e) {
        TFullScreenLoader.removeLoader();
        TLoaders.errorSnackBar(title: 'error occured', message: e.toString());
      }
    }
  }
}
