import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tradly_app/core/extensions/context_extensions.dart';
import 'package:tradly_app/core/resources/l10n_generated/l10n.dart';
import 'package:tradly_app/core/routes/app_router.dart';
import 'package:tradly_app/data/repositories/home_repo.dart';
import 'package:tradly_app/presentations/layouts/app_bar.dart';
import 'package:tradly_app/presentations/pages/home/states/home_bloc.dart';
import 'package:tradly_app/presentations/pages/home/states/home_event.dart';
import 'package:tradly_app/presentations/pages/home/views/categories_list.dart';
import 'package:tradly_app/presentations/pages/home/views/header_section.dart';
import 'package:tradly_app/presentations/pages/home/views/new_product_list.dart';
import 'package:tradly_app/presentations/pages/home/views/popular_product_list.dart';
import 'package:tradly_app/presentations/pages/home/views/product_banner_list.dart';
import 'package:tradly_app/presentations/pages/home/views/search_view.dart';
import 'package:tradly_app/presentations/pages/home/views/store_follow_list.dart';
import 'package:tradly_app/presentations/widgets/assets.dart';
import 'package:tradly_app/presentations/widgets/text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
    required this.productId,
  });
  final int? productId;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Map<String, String> _categoryRouteMap = {
    S.current.productDetailBeveragesTitle: TAPaths.beverages.name,
    S.current.productDetailVegetablesTitle: TAPaths.vegetables.name,
    S.current.productDetailBreadBakeryTitle: TAPaths.breadBakely.name,
    S.current.productDetailEggTitle: TAPaths.egg.name,
    S.current.productDetailFruitTitle: TAPaths.fruit.name,
    S.current.productDetailPetCareTitle: TAPaths.petCare.name,
    S.current.productDetailFrozenVegTitle: TAPaths.frozenVeg.name,
    S.current.productDetailHomeCareTitle: TAPaths.homeCare.name,
  };

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(
        repo: context.read<HomeRepository>(),
      )..add(
          HomeInitializeEvt(
            productId: widget.productId ?? 0,
          ),
        ),
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          backgroundColor: context.colorScheme.inversePrimary,
          appBar: TaAppBar.home(
            automaticallyImplyLeading: false,
            searchForm: Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: TASearchView(
                placeholder: S.current.homeSearchProductPlaceholder,
              ),
            ),
            backgroundColor: context.colorScheme.primary,
            centerTitle: false,
            trailing: Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.favorite),
                    onPressed: () {
                      context.pushNamed(
                        TAPaths.wishlist.name,
                        extra: widget.productId,
                      );
                    },
                  ),
                  IconButton(
                    icon: TAAssets.cart(),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            title: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: TaDisplaySmallText(
                text: S.current.homeGroceriesTitle,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                const ProductBannerList(),
                CategoriesList(
                  onCategoryTap: (category) {
                    final routeName = _categoryRouteMap[category.category] ??
                        _categoryRouteMap[category.id ?? ''] ??
                        TAPaths.home.name;
                    TARouter.navigateToCategory(
                      context,
                      routeName,
                      extra: category.id,
                    );
                  },
                ),
                const SizedBox(height: 28),
                HomeSectionHeader(
                  title: S.current.homeNewProductTitle,
                  onTap: () {},
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: NewProductList(),
                ),
                const SizedBox(height: 16),
                HomeSectionHeader(
                  title: S.current.homePopularProductTitle,
                  onTap: () {},
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: PopularProductList(),
                ),
                const SizedBox(height: 30),
                Stack(
                  alignment: Alignment.center,
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      height: 184,
                      width: double.infinity,
                      color: context.colorScheme.primary,
                      child: Column(
                        children: [
                          HomeSectionHeader(
                            title: S.current.homeStoreToFolowTitle,
                            textColor: context.colorScheme.onPrimary,
                            buttonColor: context.colorScheme.onPrimary,
                            buttonText: S.current.homeViewAllButton,
                            buttonTextColor: context.colorScheme.primary,
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                    const Positioned(
                      top: 50,
                      left: 15,
                      right: 0,
                      child: StoreFollowList(),
                    ),
                  ],
                ),
                const SizedBox(height: 100),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
