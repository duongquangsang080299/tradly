import 'package:flutter/material.dart';
import 'package:tradly_app/core/constant/constants.dart';
import 'package:tradly_app/core/extensions/context_extensions.dart';
import 'package:tradly_app/core/resources/l10n_generated/l10n.dart';
import 'package:tradly_app/data/models/product_model.dart';
import 'package:tradly_app/presentations/layouts/app_bar.dart';
import 'package:tradly_app/presentations/layouts/scaffold.dart';
import 'package:tradly_app/presentations/widgets/assets.dart';
import 'package:tradly_app/presentations/widgets/images.dart';
import 'package:tradly_app/presentations/widgets/not_found.dart';
import 'package:tradly_app/presentations/widgets/text.dart';
import 'package:intl/date_symbol_data_local.dart';

class OrderHistoryScreen extends StatelessWidget {
  const OrderHistoryScreen({super.key, this.product});

  final ProductModel? product;

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('en', null);
    return TAScaffold(
      appBar: TaAppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        toolbarHeight: TaAppBarSize.small,
        title: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: TADisplaySmallText(
            text: S.current.orderHistoryTitle,
            fontWeight: FontWeight.w700,
          ),
        ),
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
      body: product != null
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      TAHeadlineLargeText(
                        text: S.current.orderTransactionsTitle,
                        fontWeight: FontWeight.w700,
                        color: context.colorScheme.inverseSurface,
                      ),
                      SizedBox(width: 15),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: context.colorScheme.tertiaryContainer,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: TATitleLargeText(
                          text: dateTimeFormat(DateTime.now()),
                          fontWeight: FontWeight.w700,
                          color: context.colorScheme.primary,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: [
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  TAImageRectangle(
                                    borderRadius: 5,
                                    product?.imageUrl ?? '',
                                    width: 40,
                                    height: 40,
                                    boxFit: BoxFit.cover,
                                  ),
                                  SizedBox(width: 22),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TATitleLargeText(
                                        text: product?.title ?? '',
                                        color:
                                            context.colorScheme.inverseSurface,
                                      ),
                                      SizedBox(height: 3),
                                      TAHeadlineSmallText(
                                        text: product?.price ?? '',
                                        fontWeight: FontWeight.w700,
                                        color: context.colorScheme.primary,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(100, 25),
                                ),
                                child: Text(
                                  S.current.orderHistoryDeliveredButton,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )
          : const NotFoundScreen(),
    );
  }
}
