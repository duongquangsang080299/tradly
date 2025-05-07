import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tradly_app/core/extensions/context_extensions.dart';
import 'package:tradly_app/core/resources/assets_generated/assets.gen.dart';
import 'package:tradly_app/core/resources/l10n_generated/l10n.dart';
import 'package:tradly_app/core/routes/app_router.dart';
import 'package:tradly_app/presentations/layouts/app_bar.dart';
import 'package:tradly_app/presentations/layouts/scaffold.dart';
import 'package:tradly_app/presentations/pages/home/views/search_view.dart';
import 'package:tradly_app/presentations/pages/store/states/store_bloc.dart';
import 'package:tradly_app/presentations/pages/store/states/store_event.dart';
import 'package:tradly_app/presentations/pages/store/states/store_state.dart';
import 'package:tradly_app/presentations/pages/store/views/add_product.dart';
import 'package:tradly_app/presentations/widgets/assets.dart';
import 'package:tradly_app/presentations/widgets/button.dart';
import 'package:tradly_app/presentations/widgets/card.dart';
import 'package:tradly_app/presentations/widgets/icons.dart';
import 'package:tradly_app/presentations/widgets/images.dart';
import 'package:tradly_app/presentations/widgets/text.dart';

class StoreScreen extends StatefulWidget {
  const StoreScreen({super.key});

  @override
  State<StoreScreen> createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  @override
  Widget build(BuildContext context) {
    return TAScaffold(
      appBar: TaAppBar(
        toolbarHeight: TaAppBarSize.small,
        bottomType: TaAppBarBottomType.none,
        title: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: TADisplaySmallText(
            text: S.current.storeTitle,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: false,
        backgroundColor: context.colorScheme.primary,
        trailing: Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.favorite),
                onPressed: () {},
              ),
              IconButton(
                icon: TAAssets.cart(),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
      body: BlocBuilder<StoreBloc, StoreState>(
        buildWhen: (previous, current) =>
            previous.products != current.products ||
            previous.status != current.status,
        builder: (context, state) {
          if (state.status is StoreStatusLoading) {
            return Center(
              child: CircularProgressIndicator(
                color: context.colorScheme.primary,
              ),
            );
          }
          return state.hasStore
              ? SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        color: context.colorScheme.onPrimary,
                        child: Column(
                          children: [
                            const SizedBox(height: 30),
                            Center(
                              child: TAImageCircle(
                                radius: 32,
                                Assets.images.imgTradly.path,
                                boxFit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(height: 16),
                            TADisplaySmallText(
                              text: state.stores?.name ?? '',
                              fontWeight: FontWeight.w700,
                              color: context.colorScheme.onSurface,
                            ),
                            const SizedBox(height: 12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                OutlinedButton(
                                  onPressed: () {},
                                  style: OutlinedButton.styleFrom(
                                    minimumSize: const Size(100, 25),
                                    side: BorderSide(
                                      color: context.colorScheme.primary,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                  ),
                                  child: TATitleMediumText(
                                    text: S.current.storeEditStoreButton,
                                    color: context.colorScheme.primary,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                OutlinedButton(
                                  onPressed: () {},
                                  style: OutlinedButton.styleFrom(
                                    minimumSize: const Size(100, 25),
                                    side: BorderSide(
                                      color: context.colorScheme.primary,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                  ),
                                  child: TATitleMediumText(
                                    text: S.current.storeViewButton,
                                    color: context.colorScheme.primary,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Divider(color: Colors.grey[300]),
                            TextButton(
                              onPressed: () {},
                              child: TATitleLargeText(
                                text: S.current.storeRemoveButton,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),
                      state.hasProducts
                          ? _buildProductsList(context, state)
                          : _buildNoProductsContent(),
                    ],
                  ),
                )
              : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        height: 120,
                        Assets.images.imgEmptyStore.path,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(height: 30),
                      TAHeadlineMediumText(
                        text: S.current.storeNoStore,
                        color: context.colorScheme.onSurface,
                        fontWeight: FontWeight.w600,
                      ),
                      const SizedBox(height: 37),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 100),
                        child: TAElevatedButton(
                          text: S.current.storeCreateStoreButton,
                          backgroundColor: context.colorScheme.primary,
                          onPressed: () {
                            context.pushNamed(TAPaths.createStore.name);
                          },
                        ),
                      ),
                    ],
                  ),
                );
        },
      ),
    );
  }

  Widget _buildNoProductsContent() {
    return Column(
      children: [
        SizedBox(height: 30),
        TAHeadlineMediumText(
          text: S.current.storeNoProduct,
          fontWeight: FontWeight.w600,
          color: context.colorScheme.onSurface,
        ),
        const SizedBox(height: 40),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 90),
          child: TAOutlinedButton(
            textColor: context.colorScheme.primary,
            text: S.current.storeAddProductButton,
            onPressed: () {
              context.pushNamed(TAPaths.addProduct.name);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildProductsList(
    BuildContext context,
    StoreState state,
  ) {
    final products = state.products ?? [];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TASearchView(
            placeholder: S.current.homeSearchProductPlaceholder,
          ),
        ),
        const SizedBox(height: 27),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TAHeadlineMediumText(
            text: S.current.storeProductsTitle,
            fontWeight: FontWeight.w600,
            color: context.colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.9,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: products.length + 1,
            itemBuilder: (context, index) {
              if (index == products.length) {
                return AddProductCard(
                  onTap: () {
                    context.pushNamed(TAPaths.addProduct.name);
                  },
                );
              } else {
                final product = products[index];
                return Stack(
                  clipBehavior: Clip.none,
                  children: [
                    SizedBox(
                      height: 300,
                      width: double.infinity,
                      child: TACardProduct(
                        product: product,
                      ),
                    ),
                    Positioned(
                      top: 60,
                      left: 40,
                      child: Row(
                        children: [
                          GestureDetector(
                            child: Container(
                                width: 32,
                                height: 32,
                                decoration: BoxDecoration(
                                  color: context
                                      .colorScheme.onSecondaryContainer
                                      .withOpacity(0.5),
                                  shape: BoxShape.circle,
                                ),
                                child: TAIcons.edit()),
                            onTap: () {
                              final product = products[index];
                              TARouter.navigateTo(
                                context,
                                TAPaths.editProduct.name,
                                extra: product,
                              );
                            },
                          ),
                          const SizedBox(width: 50),
                          GestureDetector(
                            onTap: () {
                              context.read<StoreBloc>().add(
                                    DeleteProductEvt(
                                      productId:
                                          state.products![index].id.toString(),
                                    ),
                                  );
                            },
                            child: Container(
                              width: 32,
                              height: 32,
                              decoration: BoxDecoration(
                                color: context.colorScheme.onSecondaryContainer
                                    .withOpacity(0.5),
                                shape: BoxShape.circle,
                              ),
                              child: TAIcons.delete(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
