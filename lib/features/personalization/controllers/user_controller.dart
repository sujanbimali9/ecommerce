import 'package:ecommerce_flutter/data/repositories/authentication/authentication_repository.dart';
import 'package:ecommerce_flutter/data/repositories/user/user_repository.dart';
import 'package:ecommerce_flutter/features/authentication/models/user_model.dart';
import 'package:ecommerce_flutter/features/authentication/screens/login/login_screen.dart';
import 'package:ecommerce_flutter/features/personalization/screens/profile/reauthenticate/reauthenticate_user.dart';
import 'package:ecommerce_flutter/utils/constants/image_strings.dart';
import 'package:ecommerce_flutter/utils/helpers/network_manager.dart';
import 'package:ecommerce_flutter/utils/popups/full_screen_loader.dart';
import 'package:ecommerce_flutter/utils/popups/loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();
  late final UserRepository userRepository;
  Rx<UserModel> user = UserModel.empty.obs;

  final TextEditingController verifyEmail = TextEditingController();
  final TextEditingController verifyPassword = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final hidePassword = true.obs;
  @override
  onInit() {
    userRepository = Get.put(UserRepository());
    getUserData();
    super.onInit();
  }

  Future<void> deleteAccountWarningPopup(BuildContext context) async {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(
                "Are you sure you want to delete your accout. This action is irreversible and your data will be removed permanently",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              actions: [
                OutlinedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('cancel')),
                ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    onPressed: deleteUserAccount,
                    child: const Text('Yes'))
              ],
            ));
  }

  Future<void> deleteUserAccount() async {
    try {
      final auth = AuthenticaitonRepository.instance;
      final provider = auth.user!.providerData.map((e) => e.providerId).first;
      if (provider.isNotEmpty) {
        if (provider == 'google.com') {
          TFullScreenLoader.openLoadingDialog(
              'processing your request', TImages.loading);
          await auth.loginWithGoogle();
          await auth.signOut();
          await userRepository.deleteUserData();
          await auth.deleteUser();
          TFullScreenLoader.removeLoader();
          Get.offAll(() => const LoginScreen());
        } else if (provider == 'password') {
          Get.to(() => const ReauthenticateUserScreen());
        }
      }
    } catch (e) {
      TFullScreenLoader.removeLoader();
      TLoaders.errorSnackBar(title: 'error occured', message: e.toString());
    }
  }

  Future<void> reauthenticateUser() async {
    try {
      if (formKey.currentState!.validate()) {
        if (!(await NetworkManager.instance.isConnected())) {
          return;
        }
        TFullScreenLoader.openLoadingDialog('loading', TImages.loading);
        await AuthenticaitonRepository.instance.reauthenticateUser(
            verifyEmail.text.trim(), verifyPassword.text.trim());
        await AuthenticaitonRepository.instance.loginWithGoogle();
        await AuthenticaitonRepository.instance.signOut();

        await userRepository.deleteUserData();
        TFullScreenLoader.removeLoader();
        Get.offAll(() => const LoginScreen());
      }
    } catch (e) {
      TFullScreenLoader.removeLoader();
      TLoaders.errorSnackBar(title: 'error occured', message: e.toString());
      TLoaders.errorSnackBar(title: 'error occured', message: e.toString());
    }
  }

  Future<void> saveUserData(UserCredential? userCredential) async {
    try {
      if (userCredential != null &&
          !(await userRepository.userExits(userCredential.user?.uid ?? ''))) {
        final user = userCredential.user;
        final nameparts = UserModel.nameparts(user?.displayName ?? '');
        final UserModel userModel = UserModel(
            email: user?.email ?? '',
            firstName: nameparts.first,
            userName: UserModel.genetrateUsername(user?.displayName ?? ''),
            id: user?.uid ?? '',
            lastName:
                nameparts.length > 1 ? nameparts.sublist(1).join(' ') : '',
            phoneNo: user?.phoneNumber ?? '',
            profilePicture: user?.photoURL ?? '');
        await userRepository.saveNewUser(userModel);
      }
    } catch (e) {
      throw e.toString();
    }
  }

  Future<void> getUserData() async {
    try {
      final user = await userRepository.getUser();
      this.user(user);
    } catch (e) {
      throw e.toString();
    }
  }

  Future<void> updateUserData(UserModel user) async {
    try {
      await userRepository.updateUser(user);
    } catch (e) {
      throw e.toString();
    }
  }

  Future<void> updateSingleField(Map<String, dynamic> data) async {
    try {
      await userRepository.updateSingleField(data);
    } catch (e) {
      throw e.toString();
    }
  }

  Future<void> uploadProfilePicture() async {
    final ImagePicker picker = ImagePicker();

    try {
      final XFile? image = await picker.pickImage(
          source: ImageSource.gallery,
          maxHeight: 512,
          maxWidth: 512,
          imageQuality: 70);
      if (image != null) {
        final url = await userRepository.uploadImage(
            'Users/images/profilePictures/${user.value.id}', image);
        await userRepository.updateSingleField({'profilePicture': url});
        user.value.profilePicture = url;
        user.refresh();
      }
    } catch (e) {
      TLoaders.errorSnackBar(title: 'error occured', message: e.toString());
    }
  }
}
