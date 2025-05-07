import 'dart:io';
import 'package:flutter/material.dart';
import 'package:tradly_app/core/extensions/context_extensions.dart';
import 'package:tradly_app/core/resources/l10n_generated/l10n.dart';
import 'package:tradly_app/presentations/layouts/app_bar.dart';
import 'package:tradly_app/presentations/layouts/scaffold.dart';
import 'package:tradly_app/presentations/pages/store/states/store_state.dart';
import 'package:tradly_app/presentations/widgets/button.dart';
import 'package:tradly_app/presentations/widgets/icons.dart';
import 'package:tradly_app/presentations/widgets/text.dart';
import 'package:tradly_app/presentations/widgets/text_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tradly_app/data/models/product_model.dart';
import 'package:tradly_app/presentations/pages/store/states/store_bloc.dart';
import 'package:tradly_app/presentations/pages/store/states/store_event.dart';

class AddProductDetailScreen extends StatefulWidget {
  const AddProductDetailScreen({super.key});

  @override
  State<AddProductDetailScreen> createState() => _AddProductDetailScreenState();
}

class _AddProductDetailScreenState extends State<AddProductDetailScreen> {
  final _formKey = GlobalKey<FormState>();
  final _productNameController = TextEditingController();
  final _categoryProductController = TextEditingController();
  final _priceController = TextEditingController();
  final _offerPriceController = TextEditingController();
  final _locationController = TextEditingController();
  final _productDescriptionController = TextEditingController();
  final _additionalDetailsController = TextEditingController();
  final _priceTypeController = TextEditingController();

  final int _maxPhotos = 4;

  List<String> _additionalDetails = ['Cash on delivery', 'Available'];

  @override
  void dispose() {
    _productNameController.dispose();
    _categoryProductController.dispose();
    _priceController.dispose();
    _offerPriceController.dispose();
    _locationController.dispose();
    _productDescriptionController.dispose();
    _additionalDetailsController.dispose();
    _priceTypeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TAScaffold(
      appBar: TaAppBar(
        toolbarHeight: TaAppBarSize.small,
        backgroundColor: context.colorScheme.primary,
        title: Padding(
          padding: EdgeInsets.only(left: 16),
          child: TADisplaySmallText(
            text: S.current.storeAddProductButton,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: BlocBuilder<StoreBloc, StoreState>(
        buildWhen: (previous, current) =>
            previous.imageFiles != current.imageFiles,
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 21),
                  child: _buildPhotoUploadSection(state),
                ),
                const SizedBox(height: 14),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TATitleLargeText(
                    text: S.current.storeMaxPhotoProductTitle,
                    color: context.colorScheme.outline,
                  ),
                ),
                const SizedBox(height: 27),
                Container(
                  padding: const EdgeInsets.all(20),
                  color: context.colorScheme.onPrimary,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TATextField(
                          label: S.current.storeProductNameLabel,
                          controller: _productNameController,
                        ),
                        TATextField(
                          label: S.current.storeCategoryProductLabel,
                          controller: _categoryProductController,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: TATextField(
                                prefixIcon: TAIcons.attachMoney(),
                                label: S.current.storePriceLabel,
                                controller: _priceController,
                                keyboardType: TextInputType.number,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: TATextField(
                                prefixIcon: TAIcons.attachMoney(),
                                label: S.current.storeOfferPriceLabel,
                                controller: _offerPriceController,
                                keyboardType: TextInputType.number,
                              ),
                            ),
                          ],
                        ),
                        TATextField(
                          label: S.current.storeLocationDetailsLabel,
                          controller: _locationController,
                          suffixIcon: TAIcons.map(),
                        ),
                        TATextField(
                          label: S.current.storeProductDescriptionLabel,
                          controller: _productDescriptionController,
                        ),
                        TATextField(
                          label: S.current.storePriceTypeLabel,
                          controller: _priceTypeController,
                        ),
                        TATextField(
                          label: S.current.storeAddDeataisLabel,
                          isChipInput: true,
                          chips: _additionalDetails,
                          onChipsChanged: (chips) {
                            setState(() {
                              _additionalDetails = chips;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(20),
        color: context.colorScheme.onPrimary,
        child: TAElevatedButton(
          backgroundColor: context.colorScheme.primary,
          text: S.current.storeAddProductButton,
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              if ((context.read<StoreBloc>().state.imageFiles?.isEmpty ??
                  true)) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(S.current.storeMessageProduct),
                    duration: Duration(seconds: 2),
                  ),
                );
                return;
              }

              final product = ProductModel(
                title: _productNameController.text,
                categoryType: _categoryProductController.text,
                price: _priceController.text,
                location: _locationController.text,
                description: _productDescriptionController.text,
                priceType: _priceTypeController.text,
                imageUrl: context.read<StoreBloc>().state.imageFiles!.isNotEmpty
                    ? context.read<StoreBloc>().state.imageFiles!.first.path
                    : '',
              );

              context.read<StoreBloc>().add(AddProductEvt(
                    product: product,
                  ));

              Navigator.pop(context, product);
            }
          },
        ),
      ),
    );
  }

  Widget _buildPhotoUploadSection(StoreState state) {
    return SizedBox(
      height: 105,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: (state.imageFiles?.length ?? 0) + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.only(right: 16),
              child: _buildAddPhotoBox(),
            );
          } else {
            return _buildPhotoBox(state.imageFiles![index - 1], index - 1);
          }
        },
      ),
    );
  }

  Widget _buildAddPhotoBox() {
    return GestureDetector(
      onTap: () {
        context.read<StoreBloc>().add(
              PickImageEvt(maxPhotos: _maxPhotos),
            );
      },
      child: Container(
        width: 140,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: context.colorScheme.onPrimaryContainer,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TAIcons.add(),
            TATitleLargeText(
              text: S.current.storeAddPhotoTitle,
              color: context.colorScheme.onSecondary,
              fontWeight: FontWeight.w600,
            ),
            TALabelLargeText(
              text: S.current.storeAddPhotoDescription,
              color: context.colorScheme.onPrimaryContainer,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPhotoBox(File imageFile, int index) {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      width: 140,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.file(
              imageFile,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          Positioned(
            top: 4,
            right: 4,
            child: GestureDetector(
              onTap: () {
                context.read<StoreBloc>().add(RemoveImageEvt(index: index));
              },
              child: Container(
                decoration: BoxDecoration(shape: BoxShape.circle),
                child: TAIcons.close(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
