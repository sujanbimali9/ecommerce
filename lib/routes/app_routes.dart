import 'package:ecommerce_flutter/features/authentication/screens/login/login_screen.dart';
import 'package:ecommerce_flutter/features/authentication/screens/onboarding/on_boarding_screen.dart';
import 'package:ecommerce_flutter/features/authentication/screens/password_configuration/forget_password_screen.dart';
import 'package:ecommerce_flutter/features/authentication/screens/password_configuration/reset_password_screen.dart';
import 'package:ecommerce_flutter/features/authentication/screens/signup/signup_screen.dart';
import 'package:ecommerce_flutter/features/authentication/screens/signup/signup_success_screen.dart';
import 'package:ecommerce_flutter/features/authentication/screens/signup/signup_verify_screen.dart';
import 'package:ecommerce_flutter/features/personalization/screens/address/address.dart';
import 'package:ecommerce_flutter/features/personalization/screens/profile/profile_screen.dart';
import 'package:ecommerce_flutter/features/personalization/screens/setting_screen/setting_screen.dart';
import 'package:ecommerce_flutter/features/shop/screens/allbrands/all_brand_screen.dart';
import 'package:ecommerce_flutter/features/shop/screens/allproduct/all_product_screen.dart';
import 'package:ecommerce_flutter/features/shop/screens/cart/cart_screen.dart';
import 'package:ecommerce_flutter/features/shop/screens/checkout/checkout_screen.dart';
import 'package:ecommerce_flutter/features/shop/screens/favourite/wishlist_screen.dart';
import 'package:ecommerce_flutter/features/shop/screens/home/home_screen.dart';
import 'package:ecommerce_flutter/features/shop/screens/myorders/my_order_screen.dart';
import 'package:ecommerce_flutter/features/shop/screens/product_detail/product_detail_screen.dart';
import 'package:ecommerce_flutter/features/shop/screens/review/review_screen.dart';
import 'package:ecommerce_flutter/features/shop/screens/shop/shop_screen.dart';
import 'package:ecommerce_flutter/features/shop/screens/subcategory/sub_category.dart';
import 'package:ecommerce_flutter/routes/routes.dart';
import 'package:get/get.dart';

class AppRoutes {
  static final page = [
    GetPage(name: '/', page: () => const HomeScreen()),
    GetPage(name: TRoutes.store, page: () => const StoreScreen()),
    GetPage(name: TRoutes.favourites, page: () => const WishlistScreen()),
    GetPage(name: TRoutes.settings, page: () => const SettingScreen()),
    GetPage(name: TRoutes.subCategories, page: () => const SubCategoryScreen()),
    GetPage(
        name: TRoutes.productReviews, page: () => const ProductReviewScreen()),
    // GetPage(
    //     name: TRoutes.productDetails, page: () => const ProductDetailScreen()),
    GetPage(name: TRoutes.order, page: () => const MyOrderScreen()),
    GetPage(name: TRoutes.checkout, page: () => const CheckoutScreen()),
    GetPage(name: TRoutes.cart, page: () => const CartScreen()),
    GetPage(name: TRoutes.brand, page: () => const AllBrandScreen()),
    GetPage(name: TRoutes.allProducts, page: () => const AllProductScreen()),
    GetPage(name: TRoutes.userProfile, page: () => const ProfileScreen()),
    GetPage(name: TRoutes.userAddress, page: () => const UserAddressScreen()),
    GetPage(name: TRoutes.signUp, page: () => const SignUpScreen()),
    GetPage(
        name: TRoutes.signUpSuccess, page: () => const SignUpSuccessScreen()),
    GetPage(
        name: TRoutes.verifyEmail,
        page: () => const SignUpVerifyScreen(email: '')),
    GetPage(name: TRoutes.signIn, page: () => const LoginScreen()),
    GetPage(
        name: TRoutes.forgotPassword, page: () => const ForgetPasswordScreen()),
    GetPage(
        name: TRoutes.resetPassword, page: () => const ResetPasswordScreen()),
    GetPage(name: TRoutes.onBoarding, page: () => const OnBoardingScreen()),
  ];
}
