import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tradly_app/core/extensions/context_extensions.dart';
import 'package:tradly_app/core/resources/l10n_generated/l10n.dart';
import 'package:tradly_app/core/routes/app_router.dart';
import 'package:tradly_app/core/service/notification_service.dart';
import 'package:tradly_app/data/models/product_model.dart';
import 'package:tradly_app/presentations/layouts/app_bar.dart';
import 'package:tradly_app/presentations/layouts/scaffold.dart';
import 'package:tradly_app/presentations/widgets/button.dart';
import 'package:tradly_app/presentations/widgets/images.dart';
import 'package:tradly_app/presentations/widgets/text.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({
    super.key,
    this.product,
  });

  final ProductModel? product;

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final supabase = Supabase.instance.client;
  final notiService = NotificationService();

  @override
  void initState() {
    super.initState();
    notiService.init();
    notiService.initializeFirebaseMessaging();
  }

  @override
  Widget build(BuildContext context) {
    return TAScaffold(
      appBar: TaAppBar.wishlist(
        title: S.current.checkoutTitle,
        onBackPressed: () => Navigator.pop(context),
        backgroundColor: context.colorScheme.primary,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 52,
              color: context.colorScheme.onPrimary,
              child: Center(
                child: TATitleLargeText(
                  text: S.current.checkoutAddNewAddressTitle,
                  color: context.colorScheme.onSurface,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              color: context.colorScheme.onPrimary,
              child: Column(
                children: [
                  SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        TAImageRectangle(
                          widget.product?.imageUrl ?? '',
                          isBorderTop: true,
                          width: 100,
                          height: 100,
                          boxFit: BoxFit.cover,
                        ),
                        SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TATitleLargeText(
                              text: widget.product?.title ?? '',
                              color: context.colorScheme.onSurface,
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                TATitleLargeText(
                                  text: widget.product?.newPrice ?? '',
                                  color: context.colorScheme.primary,
                                ),
                                const SizedBox(width: 5),
                                TATitleLargeText(
                                  text: widget.product?.price ?? '',
                                  color: context.colorScheme.onSurface,
                                ),
                                const SizedBox(width: 5),
                                TATitleLargeText(
                                  text: '50% off ',
                                  color: context.colorScheme.onSurface,
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            TATitleMediumText(
                              text: "Qty : 1",
                              color: context.colorScheme.onSurface,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
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
            const SizedBox(height: 60),
            Container(
              width: double.infinity,
              color: context.colorScheme.onPrimary,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TAHeadlineMediumText(
                          text: S.current.checkoutPriceDetailsTitle,
                          fontWeight: FontWeight.w600,
                          color: context.colorScheme.onSurface,
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TATitleLargeText(
                              text: S.current.checkoutPriceItemTitle('1'),
                              color: context.colorScheme.onSurface,
                              fontWeight: FontWeight.w500,
                            ),
                            TATitleLargeText(
                              text: widget.product?.newPrice ?? '',
                              color: context.colorScheme.onSurface,
                              fontWeight: FontWeight.w500,
                            )
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TATitleLargeText(
                              text: S.current.checkoutDeliveryFreeTitle,
                              color: context.colorScheme.onSurface,
                              fontWeight: FontWeight.w500,
                            ),
                            TATitleLargeText(
                              text: S.current.checkoutInforTitle,
                              color: context.colorScheme.onSurface,
                              fontWeight: FontWeight.w500,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Divider(color: Colors.grey[300]),
                  const SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TAHeadlineMediumText(
                          text: S.current.checkoutTotalAmountTitle,
                          fontWeight: FontWeight.w600,
                          color: context.colorScheme.onSurface,
                        ),
                        TATitleLargeText(
                          text: widget.product?.newPrice ?? '',
                          color: context.colorScheme.onSurface,
                          fontWeight: FontWeight.w500,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(20),
        color: context.colorScheme.onPrimary,
        child: TAElevatedButton(
          text: S.current.checkoutCheckoutButton,
          backgroundColor: context.colorScheme.primary,
          onPressed: () async {
            final orderData = {
              'title': widget.product?.title,
              'price': widget.product?.price,
              'newPrice': widget.product?.newPrice,
              'imageUrl': widget.product?.imageUrl,
            };
            await supabase.from('orders').insert(orderData);

            if (context.mounted) {
              context.goNamed(
                TAPaths.orderHistory.name,
                extra: widget.product,
              );
            }
          },
        ),
      ),
    );
  }
}
