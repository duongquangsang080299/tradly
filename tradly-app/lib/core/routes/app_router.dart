import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tradly_app/core/extensions/context_extensions.dart';
import 'package:tradly_app/core/resources/l10n_generated/l10n.dart';
import 'package:tradly_app/core/routes/router_guard.dart';
import 'package:tradly_app/data/models/product_model.dart';
import 'package:tradly_app/presentations/layouts/bottom_navigation_bar.dart';
import 'package:tradly_app/presentations/layouts/scaffold.dart';
import 'package:tradly_app/presentations/pages/auth/sign_in/sign_in_screen.dart';
import 'package:tradly_app/presentations/pages/auth/sign_up/sign_up_screen.dart';
import 'package:tradly_app/presentations/pages/browse/browse.dart';
import 'package:tradly_app/presentations/pages/home/home_screen.dart';
import 'package:tradly_app/presentations/pages/on_boarding/on_boarding_screen.dart';
import 'package:tradly_app/presentations/pages/order_history/order_history.dart';
import 'package:tradly_app/presentations/pages/product_detail/product_detail.dart';
import 'package:tradly_app/presentations/pages/product_detail/views/checkout.dart';
import 'package:tradly_app/presentations/pages/product_detail/views/product_list.dart';
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
        name: TAPaths.checkout.name,
        path: TAPaths.checkout.path,
        builder: (context, state) => const CheckoutScreen(),
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
        name: TAPaths.productList.name,
        path: TAPaths.productList.path,
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>?;
          return ProductList(
            title: extra?['title'] ?? '',
            categoryId: extra?['categoryId'] ?? 0,
          );
        },
      ),
      StatefulShellRoute.indexedStack(
        parentNavigatorKey: rootNavigatorKey,
        builder: (context, state, navigationShell) => TAScaffold(
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
                builder: (context, state) {
                  final product = state.extra is ProductModel
                      ? state.extra as ProductModel
                      : null;
                  return OrderHistoryScreen(product: product);
                },
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
  home(
    name: 'home',
    path: '/home',
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
  productDetail(
    name: 'productDetail',
    path: '/productDetail',
  ),
  profile(
    name: 'profile',
    path: '/profile',
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
  checkout(
    name: 'myCart',
    path: '/myCart',
  ),
  productList(
    name: 'productList',
    path: '/productList',
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

List<TABottomNavigationBarItem> bottomNavigationBarItems(BuildContext context) {
  final List<TABottomNavigationBarItem> navigationItems = [
    TABottomNavigationBarItem(
      icon: TAAssets.home(),
      activeIcon: TAAssets.home(
        color: context.colorScheme.primary,
      ),
      label: S.current.homeLabel,
    ),
    TABottomNavigationBarItem(
      icon: TAAssets.search(),
      activeIcon: TAAssets.search(
        color: context.colorScheme.primary,
      ),
      label: S.current.homeBrowseLabel,
    ),
    TABottomNavigationBarItem(
      icon: TAAssets.store(),
      activeIcon: TAAssets.store(
        color: context.colorScheme.primary,
      ),
      label: S.current.homeStoreLabel,
    ),
    TABottomNavigationBarItem(
      icon: TAAssets.order(),
      activeIcon: TAAssets.order(
        color: context.colorScheme.primary,
      ),
      label: S.current.homeOrderHistoryLabel,
    ),
    TABottomNavigationBarItem(
      icon: TAAssets.profile(),
      activeIcon: TAAssets.profile(
        color: context.colorScheme.primary,
      ),
      label: S.current.homeProfileLabel,
    ),
  ];
  return navigationItems;
}
