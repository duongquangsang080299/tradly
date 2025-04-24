import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tradly_app/core/resources/l10n_generated/l10n.dart';
import 'package:tradly_app/core/routes/router_guard.dart';
import 'package:tradly_app/data/models/product_model.dart';
import 'package:tradly_app/presentations/layouts/bottom_navigation_bar.dart';
import 'package:tradly_app/presentations/pages/auth/otp_verification_screen.dart';
import 'package:tradly_app/presentations/pages/auth/send_otp_screen.dart';
import 'package:tradly_app/presentations/pages/auth/sign_in_screen.dart';
import 'package:tradly_app/presentations/pages/auth/sign_up_screen.dart';
import 'package:tradly_app/presentations/pages/browse/browse.dart';
import 'package:tradly_app/presentations/pages/home/home_screen.dart';
import 'package:tradly_app/presentations/pages/on_boarding/on_boarding_screen.dart';
import 'package:tradly_app/presentations/pages/order_history/order_history_screen.dart';
import 'package:tradly_app/presentations/pages/product_detail/product_detail.dart';
import 'package:tradly_app/presentations/pages/product_detail/views/beverages_list.dart';
import 'package:tradly_app/presentations/pages/product_detail/views/bread_bakery_list.dart';
import 'package:tradly_app/presentations/pages/product_detail/views/egg_list.dart';
import 'package:tradly_app/presentations/pages/product_detail/views/frozen_veg_list.dart';
import 'package:tradly_app/presentations/pages/product_detail/views/fruit_list.dart';
import 'package:tradly_app/presentations/pages/product_detail/views/home_care_list.dart';
import 'package:tradly_app/presentations/pages/product_detail/views/pet_care.dart';
import 'package:tradly_app/presentations/pages/product_detail/views/vegetables_list.dart';
import 'package:tradly_app/presentations/pages/product_detail/views/wish_list.dart';
import 'package:tradly_app/presentations/pages/profile/profile.dart';
import 'package:tradly_app/presentations/pages/store/store.dart';
import 'package:tradly_app/presentations/pages/store/views/add_product_detail.dart';
import 'package:tradly_app/presentations/pages/store/views/create_store.dart';
import 'package:tradly_app/presentations/pages/store/views/edit_product.dart';
import 'package:tradly_app/presentations/widgets/assets.dart';
import 'package:tradly_app/presentations/widgets/not_found.dart';

class TARouter {
  static final rootNavigatorKey = GlobalKey<NavigatorState>();

  static final router = GoRouter(
    initialLocation: TAPaths.onboarding.path,
    navigatorKey: rootNavigatorKey,
    routes: _getRoutes(),
    errorBuilder: (context, state) => const NotFoundScreen(),
    redirect: (context, state) => RouterGuard.authGuard(context, state),
  );

  static List<RouteBase> _getRoutes() {
    return [
      GoRoute(
        name: TAPaths.onboarding.name,
        path: TAPaths.onboarding.path,
        builder: (context, state) => const OnBoardingScreen(),
      ),
      GoRoute(
        name: TAPaths.signIn.name,
        path: TAPaths.signIn.path,
        builder: (context, state) => const SignInScreen(),
      ),
      GoRoute(
        name: TAPaths.signUp.name,
        path: TAPaths.signUp.path,
        builder: (context, state) => const SignUpScreen(),
      ),
      GoRoute(
        name: TAPaths.productDetail.name,
        path: TAPaths.productDetail.path,
        builder: (context, state) {
          final productId = state.extra is int ? state.extra as int : null;
          return ProductDetailPage(
            productId: productId ?? 0,
          );
        },
      ),
      GoRoute(
        name: TAPaths.sendOTP.name,
        path: TAPaths.sendOTP.path,
        builder: (context, state) => const SendOtpScreen(),
      ),
      GoRoute(
        name: TAPaths.otpVerification.name,
        path: TAPaths.otpVerification.path,
        builder: (context, state) => const OtpVerificationScreen(),
      ),
      GoRoute(
        name: TAPaths.addProduct.name,
        path: TAPaths.addProduct.path,
        builder: (context, state) => const AddProductDetailScreen(),
      ),
      GoRoute(
        name: TAPaths.createStore.name,
        path: TAPaths.createStore.path,
        builder: (context, state) => const CreateStoreScreen(),
      ),
      GoRoute(
        name: TAPaths.editProduct.name,
        path: TAPaths.editProduct.path,
        builder: (context, state) {
          final product = state.extra as ProductModel;
          return EditProductScreen(product: product);
        },
      ),
      GoRoute(
        name: TAPaths.wishlist.name,
        path: TAPaths.wishlist.path,
        builder: (context, state) {
          final productId = state.extra is int ? state.extra as int : null;
          return WishListPage(
            productId: productId ?? 0,
          );
        },
      ),
      GoRoute(
        name: TAPaths.beverages.name,
        path: TAPaths.beverages.path,
        builder: (context, state) {
          final categoryId = state.extra is int ? state.extra as int : null;
          return BeveragesList(
            categoryId: categoryId,
          );
        },
      ),
      GoRoute(
        name: TAPaths.vegetables.name,
        path: TAPaths.vegetables.path,
        builder: (context, state) {
          final categoryId = state.extra is int ? state.extra as int : null;
          return VegetablesList(
            categoryId: categoryId,
          );
        },
      ),
      GoRoute(
        name: TAPaths.breadBakely.name,
        path: TAPaths.breadBakely.path,
        builder: (context, state) {
          final categoryId = state.extra is int ? state.extra as int : null;
          return BreadBakeryList(
            categoryId: categoryId,
          );
        },
      ),
      GoRoute(
        name: TAPaths.egg.name,
        path: TAPaths.egg.path,
        builder: (context, state) {
          final categoryId = state.extra is int ? state.extra as int : null;
          return EggList(
            categoryId: categoryId,
          );
        },
      ),
      GoRoute(
        name: TAPaths.fruit.name,
        path: TAPaths.fruit.path,
        builder: (context, state) {
          final categoryId = state.extra is int ? state.extra as int : null;
          return FruitList(
            categoryId: categoryId,
          );
        },
      ),
      GoRoute(
        name: TAPaths.homeCare.name,
        path: TAPaths.homeCare.path,
        builder: (context, state) {
          final categoryId = state.extra is int ? state.extra as int : null;
          return HomeCareList(
            categoryId: categoryId,
          );
        },
      ),
      GoRoute(
        name: TAPaths.frozenVeg.name,
        path: TAPaths.frozenVeg.path,
        builder: (context, state) {
          final categoryId = state.extra is int ? state.extra as int : null;
          return FrozenVegList(
            categoryId: categoryId,
          );
        },
      ),
      GoRoute(
        name: TAPaths.petCare.name,
        path: TAPaths.petCare.path,
        builder: (context, state) {
          final categoryId = state.extra is int ? state.extra as int : null;
          return PetCareList(
            categoryId: categoryId,
          );
        },
      ),
      StatefulShellRoute.indexedStack(
        parentNavigatorKey: rootNavigatorKey,
        builder: (context, state, navigationShell) => Scaffold(
          body: navigationShell,
          bottomNavigationBar: TABottomNavigationBar(
            currentIndex: navigationShell.currentIndex,
            onTap: (index) {
              navigationShell.goBranch(
                index,
                initialLocation: index == navigationShell.currentIndex,
              );
            },
            items: bottomNavigationBarItems(context),
          ),
        ),
        branches: [
          StatefulShellBranch(
            navigatorKey: GlobalKey<NavigatorState>(),
            routes: [
              GoRoute(
                name: TAPaths.home.name,
                path: TAPaths.home.path,
                builder: (context, state) => const HomeScreen(productId: 1),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: GlobalKey<NavigatorState>(),
            routes: [
              GoRoute(
                name: TAPaths.browse.name,
                path: TAPaths.browse.path,
                builder: (context, state) => const BrowseScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: GlobalKey<NavigatorState>(),
            routes: [
              GoRoute(
                name: TAPaths.store.name,
                path: TAPaths.store.path,
                builder: (context, state) => const StoreScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: GlobalKey<NavigatorState>(),
            routes: [
              GoRoute(
                name: TAPaths.orderHistory.name,
                path: TAPaths.orderHistory.path,
                builder: (context, state) => const OrderHistoryScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: GlobalKey<NavigatorState>(),
            routes: [
              GoRoute(
                name: TAPaths.profile.name,
                path: TAPaths.profile.path,
                builder: (context, state) => const ProfileScreen(),
              ),
            ],
          ),
        ],
      ),
    ];
  }

  static void navigateToCategory(
    BuildContext context,
    String routeName, {
    Map<String, String>? queryParams,
    Object? extra,
  }) {
    context.pushNamed(
      routeName,
      queryParameters: queryParams ?? <String, dynamic>{},
      extra: extra,
    );
  }

  static void navigateToProductDetail(
    BuildContext context,
    String routeName, {
    Map<String, String>? queryParams,
    Object? extra,
  }) {
    context.pushNamed(
      routeName,
      queryParameters: queryParams ?? <String, dynamic>{},
      extra: extra,
    );
  }

  static void navigateTo(
    BuildContext context,
    String routeName, {
    Map<String, String>? queryParams,
    Object? extra,
  }) {
    context.pushNamed(
      routeName,
      queryParameters: queryParams ?? <String, dynamic>{},
      extra: extra,
    );
  }
}

enum TAPaths {
  onboarding(
    name: 'onboarding',
    path: '/',
  ),
  signIn(
    name: 'signIn',
    path: '/signIn',
  ),
  signUp(
    name: 'signUp',
    path: '/signUp',
  ),
  sendOTP(
    name: 'sendOTP',
    path: '/sendOTP',
  ),
  otpVerification(
    name: 'otpVerification',
    path: '/otpVerification',
  ),
  home(
    name: 'home',
    path: '/home',
  ),
  productDetail(
    name: 'productDetail',
    path: '/productDetail',
  ),
  profile(
    name: 'profile',
    path: '/profile',
  ),
  store(
    name: 'store',
    path: '/store',
  ),
  browse(
    name: 'browse',
    path: '/browse',
  ),
  orderHistory(
    name: 'orderHistory',
    path: '/orderHistory',
  ),
  addProduct(
    name: 'addProduct',
    path: '/addProduct',
  ),
  createStore(
    name: 'createStore',
    path: '/createStore',
  ),
  editProduct(
    name: 'editProduct',
    path: '/editProduct',
  ),
  wishlist(
    name: 'wishlist',
    path: '/wishlist',
  ),
  beverages(
    name: 'beverages',
    path: '/beverages',
  ),
  vegetables(
    name: 'vegetables',
    path: '/vegetables',
  ),
  breadBakely(
    name: 'breadBakely',
    path: '/breadBakely',
  ),
  frozenVeg(
    name: 'frozenVeg',
    path: '/frozenVeg',
  ),
  egg(
    name: 'egg',
    path: '/egg',
  ),
  fruit(
    name: 'fruit',
    path: '/fruit',
  ),
  homeCare(
    name: 'homeCare',
    path: '/homeCare',
  ),
  petCare(
    name: 'petCare',
    path: '/petCare',
  );

  const TAPaths({
    required this.name,
    required this.path,
  });

  final String name;

  final String path;

  @override
  String toString() => name;
}

List<LABottomNavigationBarItem> bottomNavigationBarItems(BuildContext context) {
  final List<LABottomNavigationBarItem> navigationItems = [
    LABottomNavigationBarItem(
      icon: TAAssets.home(),
      activeIcon: TAAssets.home(
        color: const Color(0xFF007A70),
      ),
      label: S.current.homeLabel,
    ),
    LABottomNavigationBarItem(
      icon: TAAssets.search(),
      activeIcon: TAAssets.search(
        color: const Color(0xFF007A70),
      ),
      label: S.current.homeBrowseLabel,
    ),
    LABottomNavigationBarItem(
      icon: TAAssets.store(),
      activeIcon: TAAssets.store(
        color: const Color(0xFF007A70),
      ),
      label: S.current.homeStoreLabel,
    ),
    LABottomNavigationBarItem(
      icon: TAAssets.order(),
      activeIcon: TAAssets.order(
        color: const Color(0xFF007A70),
      ),
      label: S.current.homeOrderHistoryLabel,
    ),
    LABottomNavigationBarItem(
      icon: TAAssets.profile(),
      activeIcon: TAAssets.profile(
        color: const Color(0xFF007A70),
      ),
      label: S.current.homeProfileLabel,
    ),
  ];
  return navigationItems;
}
