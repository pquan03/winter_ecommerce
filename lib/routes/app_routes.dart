import 'package:get/get.dart';
import 'package:winter_store/data/dummy/dummy.dart';
import 'package:winter_store/features/authentication/screens/login/login.dart';
import 'package:winter_store/features/authentication/screens/onboarding/onboarding.dart';
import 'package:winter_store/features/authentication/screens/signup/sign_up.dart';
import 'package:winter_store/features/personalization/screens/address/address.dart';
import 'package:winter_store/features/personalization/screens/orders/orders.dart';
import 'package:winter_store/features/personalization/screens/profile/profile.dart';
import 'package:winter_store/features/personalization/screens/settings/settings.dart';
import 'package:winter_store/features/shop/screens/cart/cart.dart';
import 'package:winter_store/features/shop/screens/check_out/check_out.dart';
import 'package:winter_store/features/shop/screens/home/home.dart';
import 'package:winter_store/features/shop/screens/product_details/product_detail.dart';
import 'package:winter_store/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:winter_store/features/shop/screens/store/store.dart';
import 'package:winter_store/features/shop/screens/wishlist/wishlist.dart';
import 'package:winter_store/routes/routes.dart';

class AppRoutes {
  static final pages = [
    GetPage(name: WRoutes.home, page: () => const HomeScreen()),
    GetPage(name: WRoutes.store, page: () => const StoreScreen()),
    GetPage(name: WRoutes.cart, page: () => const CartScreen()),
    GetPage(
      name: WRoutes.profile,
      page: () => const ProfileScreen(),
    ),
    GetPage(name: WRoutes.login, page: () => const LoginScreen()),
    GetPage(name: WRoutes.register, page: () => const SignUpScreen()),
    GetPage(name: WRoutes.address, page: () => const AddressesScreen()),
    GetPage(name: WRoutes.orders, page: () => const OrdersScreen()),
    GetPage(name: WRoutes.settings, page: () => const SettingScreen()),
    GetPage(name: WRoutes.checkout, page: () => const CheckoutScreen()),
    GetPage(
        name: WRoutes.productReviews, page: () => const ProductReviewsScreen()),
    GetPage(
        name: WRoutes.productDetails,
        page: () => ProductDetailScreen(
              product: WDummy.listProducts[0],
            )),
    GetPage(name: WRoutes.favorites, page: () => const FavouriteScreen()),
    GetPage(name: WRoutes.onBoarding, page: () => const OnBoardingScreen()),
  ];
}
