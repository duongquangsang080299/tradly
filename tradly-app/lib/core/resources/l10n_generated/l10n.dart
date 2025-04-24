// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Empowering Artisans, Farmers & Micro Business`
  String get onBoardingBusinessDescription {
    return Intl.message(
      'Empowering Artisans, Farmers & Micro Business',
      name: 'onBoardingBusinessDescription',
      desc: '',
      args: [],
    );
  }

  /// `Connecting NGOs, Social Enterprises with Communities`
  String get onBoardingSocialDescription {
    return Intl.message(
      'Connecting NGOs, Social Enterprises with Communities',
      name: 'onBoardingSocialDescription',
      desc: '',
      args: [],
    );
  }

  /// ` Donate, Invest & Support infrastructure projects`
  String get onBoardingsupportDescription {
    return Intl.message(
      ' Donate, Invest & Support infrastructure projects',
      name: 'onBoardingsupportDescription',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get onBoardingNextButton {
    return Intl.message(
      'Next',
      name: 'onBoardingNextButton',
      desc: '',
      args: [],
    );
  }

  /// `Finish`
  String get onBoardingFinishButton {
    return Intl.message(
      'Finish',
      name: 'onBoardingFinishButton',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to tradly`
  String get signInWelcomeTitle {
    return Intl.message(
      'Welcome to tradly',
      name: 'signInWelcomeTitle',
      desc: '',
      args: [],
    );
  }

  /// `Login to your account`
  String get signInLoginPrompt {
    return Intl.message(
      'Login to your account',
      name: 'signInLoginPrompt',
      desc: '',
      args: [],
    );
  }

  /// `Email/Mobile Number`
  String get signInEmailOrMobileLabel {
    return Intl.message(
      'Email/Mobile Number',
      name: 'signInEmailOrMobileLabel',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get signInPasswordLabel {
    return Intl.message(
      'Password',
      name: 'signInPasswordLabel',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get signInLoginButton {
    return Intl.message(
      'Login',
      name: 'signInLoginButton',
      desc: '',
      args: [],
    );
  }

  /// `Forgot your password?`
  String get signInForgotPassword {
    return Intl.message(
      'Forgot your password?',
      name: 'signInForgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account? `
  String get signInSignUpPrompt {
    return Intl.message(
      'Don\'t have an account? ',
      name: 'signInSignUpPrompt',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get signUpButton {
    return Intl.message(
      'Sign up',
      name: 'signUpButton',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to tradly`
  String get signUpWelcomeTitle {
    return Intl.message(
      'Welcome to tradly',
      name: 'signUpWelcomeTitle',
      desc: '',
      args: [],
    );
  }

  /// `Signup to your account`
  String get signUpTitle {
    return Intl.message(
      'Signup to your account',
      name: 'signUpTitle',
      desc: '',
      args: [],
    );
  }

  /// `First Name`
  String get signUpFirstNameLabel {
    return Intl.message(
      'First Name',
      name: 'signUpFirstNameLabel',
      desc: '',
      args: [],
    );
  }

  /// `Last Name`
  String get signUpLastNameLabel {
    return Intl.message(
      'Last Name',
      name: 'signUpLastNameLabel',
      desc: '',
      args: [],
    );
  }

  /// `Email ID/Phone Number`
  String get signUpEmailOrPhoneNumberLabel {
    return Intl.message(
      'Email ID/Phone Number',
      name: 'signUpEmailOrPhoneNumberLabel',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get signUpPasswordLabel {
    return Intl.message(
      'Password',
      name: 'signUpPasswordLabel',
      desc: '',
      args: [],
    );
  }

  /// `Re-enter Password`
  String get signUpReEnterPasswordLabel {
    return Intl.message(
      'Re-enter Password',
      name: 'signUpReEnterPasswordLabel',
      desc: '',
      args: [],
    );
  }

  /// `Create`
  String get signUpCreateButton {
    return Intl.message(
      'Create',
      name: 'signUpCreateButton',
      desc: '',
      args: [],
    );
  }

  /// `Have an account? `
  String get signUpAlreadyAcccount {
    return Intl.message(
      'Have an account? ',
      name: 'signUpAlreadyAcccount',
      desc: '',
      args: [],
    );
  }

  /// `Sign in`
  String get signInButton {
    return Intl.message(
      'Sign in',
      name: 'signInButton',
      desc: '',
      args: [],
    );
  }

  /// `Verify your phone number`
  String get sendOtpTitle {
    return Intl.message(
      'Verify your phone number',
      name: 'sendOtpTitle',
      desc: '',
      args: [],
    );
  }

  /// `We have sent you an SMS with a code to enter number`
  String get sendOtpDescription {
    return Intl.message(
      'We have sent you an SMS with a code to enter number',
      name: 'sendOtpDescription',
      desc: '',
      args: [],
    );
  }

  /// `Or login with Social network`
  String get sendOtpLoginSocialNetWorkTitle {
    return Intl.message(
      'Or login with Social network',
      name: 'sendOtpLoginSocialNetWorkTitle',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get sendOtpNextButton {
    return Intl.message(
      'Next',
      name: 'sendOtpNextButton',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get sendOtpPhoneNumberTitle {
    return Intl.message(
      'Phone Number',
      name: 'sendOtpPhoneNumberTitle',
      desc: '',
      args: [],
    );
  }

  /// `Phone Verification`
  String get otpVerificationTitle {
    return Intl.message(
      'Phone Verification',
      name: 'otpVerificationTitle',
      desc: '',
      args: [],
    );
  }

  /// `Enter your OTP code here`
  String get otpVerificationDescription {
    return Intl.message(
      'Enter your OTP code here',
      name: 'otpVerificationDescription',
      desc: '',
      args: [],
    );
  }

  /// `Didn’t you received any code?`
  String get otpVerificationReceivedCodeTitle {
    return Intl.message(
      'Didn’t you received any code?',
      name: 'otpVerificationReceivedCodeTitle',
      desc: '',
      args: [],
    );
  }

  /// `Resent new code`
  String get otpVerificationResentCodeTitle {
    return Intl.message(
      'Resent new code',
      name: 'otpVerificationResentCodeTitle',
      desc: '',
      args: [],
    );
  }

  /// `Verify`
  String get otpVerificationButton {
    return Intl.message(
      'Verify',
      name: 'otpVerificationButton',
      desc: '',
      args: [],
    );
  }

  /// `Email/Mobile Number is required`
  String get validatorEmailOrPhoneNumberRequired {
    return Intl.message(
      'Email/Mobile Number is required',
      name: 'validatorEmailOrPhoneNumberRequired',
      desc: '',
      args: [],
    );
  }

  /// `Email or Mobile Number is invalid format`
  String get validatorEmailWrongFormat {
    return Intl.message(
      'Email or Mobile Number is invalid format',
      name: 'validatorEmailWrongFormat',
      desc: '',
      args: [],
    );
  }

  /// `Email is invalid format`
  String get validatorPhoneWrongFormat {
    return Intl.message(
      'Email is invalid format',
      name: 'validatorPhoneWrongFormat',
      desc: '',
      args: [],
    );
  }

  /// `First Name is required`
  String get validatorFirstNameRequired {
    return Intl.message(
      'First Name is required',
      name: 'validatorFirstNameRequired',
      desc: '',
      args: [],
    );
  }

  /// `Username 6-character minimum`
  String get validatorFirstNameCharacterMinimum {
    return Intl.message(
      'Username 6-character minimum',
      name: 'validatorFirstNameCharacterMinimum',
      desc: '',
      args: [],
    );
  }

  /// `Password is required`
  String get validatorPasswordRequired {
    return Intl.message(
      'Password is required',
      name: 'validatorPasswordRequired',
      desc: '',
      args: [],
    );
  }

  /// `Password 8-character minimum`
  String get validatorPasswordCharacterMinimum {
    return Intl.message(
      'Password 8-character minimum',
      name: 'validatorPasswordCharacterMinimum',
      desc: '',
      args: [],
    );
  }

  /// `Password is least one uppercase, lowercase letter`
  String get validatorPasswordWrongFormat {
    return Intl.message(
      'Password is least one uppercase, lowercase letter',
      name: 'validatorPasswordWrongFormat',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password is required`
  String get validatorConfirmPasswordRequired {
    return Intl.message(
      'Confirm Password is required',
      name: 'validatorConfirmPasswordRequired',
      desc: '',
      args: [],
    );
  }

  /// `Password and confirm password not match`
  String get validatorConfirmedPasswordNotMatch {
    return Intl.message(
      'Password and confirm password not match',
      name: 'validatorConfirmedPasswordNotMatch',
      desc: '',
      args: [],
    );
  }

  /// `Last Name is required`
  String get validatorLastNameRequired {
    return Intl.message(
      'Last Name is required',
      name: 'validatorLastNameRequired',
      desc: '',
      args: [],
    );
  }

  /// `Groceries`
  String get homeGroceriesTitle {
    return Intl.message(
      'Groceries',
      name: 'homeGroceriesTitle',
      desc: '',
      args: [],
    );
  }

  /// `READY TO DELIVER TO\nYOUR HOME`
  String get homeBannerDescription {
    return Intl.message(
      'READY TO DELIVER TO\nYOUR HOME',
      name: 'homeBannerDescription',
      desc: '',
      args: [],
    );
  }

  /// `START SHOPPING`
  String get homeBannerTextButton {
    return Intl.message(
      'START SHOPPING',
      name: 'homeBannerTextButton',
      desc: '',
      args: [],
    );
  }

  /// `See All`
  String get homeSeeAllButton {
    return Intl.message(
      'See All',
      name: 'homeSeeAllButton',
      desc: '',
      args: [],
    );
  }

  /// `View All`
  String get homeViewAllButton {
    return Intl.message(
      'View All',
      name: 'homeViewAllButton',
      desc: '',
      args: [],
    );
  }

  /// `Follow`
  String get homeFollowButton {
    return Intl.message(
      'Follow',
      name: 'homeFollowButton',
      desc: '',
      args: [],
    );
  }

  /// `New Product `
  String get homeNewProductTitle {
    return Intl.message(
      'New Product ',
      name: 'homeNewProductTitle',
      desc: '',
      args: [],
    );
  }

  /// `Popular Product`
  String get homePopularProductTitle {
    return Intl.message(
      'Popular Product',
      name: 'homePopularProductTitle',
      desc: '',
      args: [],
    );
  }

  /// `Store to follow`
  String get homeStoreToFolowTitle {
    return Intl.message(
      'Store to follow',
      name: 'homeStoreToFolowTitle',
      desc: '',
      args: [],
    );
  }

  /// `Search Product`
  String get homeSearchProductPlaceholder {
    return Intl.message(
      'Search Product',
      name: 'homeSearchProductPlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get homeLabel {
    return Intl.message(
      'Home',
      name: 'homeLabel',
      desc: '',
      args: [],
    );
  }

  /// `Browse`
  String get homeBrowseLabel {
    return Intl.message(
      'Browse',
      name: 'homeBrowseLabel',
      desc: '',
      args: [],
    );
  }

  /// `Store`
  String get homeStoreLabel {
    return Intl.message(
      'Store',
      name: 'homeStoreLabel',
      desc: '',
      args: [],
    );
  }

  /// `Order History`
  String get homeOrderHistoryLabel {
    return Intl.message(
      'Order History',
      name: 'homeOrderHistoryLabel',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get homeProfileLabel {
    return Intl.message(
      'Profile',
      name: 'homeProfileLabel',
      desc: '',
      args: [],
    );
  }

  /// `Tradly`
  String get homeTradlyTitle {
    return Intl.message(
      'Tradly',
      name: 'homeTradlyTitle',
      desc: '',
      args: [],
    );
  }

  /// `Beverages`
  String get productDetailBeveragesTitle {
    return Intl.message(
      'Beverages',
      name: 'productDetailBeveragesTitle',
      desc: '',
      args: [],
    );
  }

  /// `Bread & Bakery`
  String get productDetailBreadBakeryTitle {
    return Intl.message(
      'Bread & Bakery',
      name: 'productDetailBreadBakeryTitle',
      desc: '',
      args: [],
    );
  }

  /// `Egg`
  String get productDetailEggTitle {
    return Intl.message(
      'Egg',
      name: 'productDetailEggTitle',
      desc: '',
      args: [],
    );
  }

  /// `Frozen Veg`
  String get productDetailFrozenVegTitle {
    return Intl.message(
      'Frozen Veg',
      name: 'productDetailFrozenVegTitle',
      desc: '',
      args: [],
    );
  }

  /// `Fruit`
  String get productDetailFruitTitle {
    return Intl.message(
      'Fruit',
      name: 'productDetailFruitTitle',
      desc: '',
      args: [],
    );
  }

  /// `Home Care`
  String get productDetailHomeCareTitle {
    return Intl.message(
      'Home Care',
      name: 'productDetailHomeCareTitle',
      desc: '',
      args: [],
    );
  }

  /// `Pet Care`
  String get productDetailPetCareTitle {
    return Intl.message(
      'Pet Care',
      name: 'productDetailPetCareTitle',
      desc: '',
      args: [],
    );
  }

  /// `Vegetables`
  String get productDetailVegetablesTitle {
    return Intl.message(
      'Vegetables',
      name: 'productDetailVegetablesTitle',
      desc: '',
      args: [],
    );
  }

  /// `50% off`
  String get productDetailSaleOffTitle {
    return Intl.message(
      '50% off',
      name: 'productDetailSaleOffTitle',
      desc: '',
      args: [],
    );
  }

  /// `Condition`
  String get productDetailConditionTitle {
    return Intl.message(
      'Condition',
      name: 'productDetailConditionTitle',
      desc: '',
      args: [],
    );
  }

  /// `Price Type`
  String get productDetailPriceTypeTitle {
    return Intl.message(
      'Price Type',
      name: 'productDetailPriceTypeTitle',
      desc: '',
      args: [],
    );
  }

  /// `CategoryTitle`
  String get productDetailCategoryTitle {
    return Intl.message(
      'CategoryTitle',
      name: 'productDetailCategoryTitle',
      desc: '',
      args: [],
    );
  }

  /// `Location`
  String get productDetailLocationTitle {
    return Intl.message(
      'Location',
      name: 'productDetailLocationTitle',
      desc: '',
      args: [],
    );
  }

  /// `Delivery Options`
  String get productDetailDeliveryOptionsTitle {
    return Intl.message(
      'Delivery Options',
      name: 'productDetailDeliveryOptionsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Delivery Details`
  String get productDetailDeliveryTitle {
    return Intl.message(
      'Delivery Details',
      name: 'productDetailDeliveryTitle',
      desc: '',
      args: [],
    );
  }

  /// `Home Delivery Available,\nCash On Delivery`
  String get productDetailDeliveryDescription {
    return Intl.message(
      'Home Delivery Available,\nCash On Delivery',
      name: 'productDetailDeliveryDescription',
      desc: '',
      args: [],
    );
  }

  /// `My Store`
  String get storeTitle {
    return Intl.message(
      'My Store',
      name: 'storeTitle',
      desc: '',
      args: [],
    );
  }

  /// `Edit Product`
  String get storeEditProductTitle {
    return Intl.message(
      'Edit Product',
      name: 'storeEditProductTitle',
      desc: '',
      args: [],
    );
  }

  /// `Products`
  String get storeProductsTitle {
    return Intl.message(
      'Products',
      name: 'storeProductsTitle',
      desc: '',
      args: [],
    );
  }

  /// `You Don't Have a Store`
  String get storeNoStore {
    return Intl.message(
      'You Don\'t Have a Store',
      name: 'storeNoStore',
      desc: '',
      args: [],
    );
  }

  /// `You don't have product`
  String get storeNoProduct {
    return Intl.message(
      'You don\'t have product',
      name: 'storeNoProduct',
      desc: '',
      args: [],
    );
  }

  /// `Create Store`
  String get storeCreateStoreButton {
    return Intl.message(
      'Create Store',
      name: 'storeCreateStoreButton',
      desc: '',
      args: [],
    );
  }

  /// `Create`
  String get storeCreateButton {
    return Intl.message(
      'Create',
      name: 'storeCreateButton',
      desc: '',
      args: [],
    );
  }

  /// `Edit Store`
  String get storeEditStoreButton {
    return Intl.message(
      'Edit Store',
      name: 'storeEditStoreButton',
      desc: '',
      args: [],
    );
  }

  /// `View Store`
  String get storeViewButton {
    return Intl.message(
      'View Store',
      name: 'storeViewButton',
      desc: '',
      args: [],
    );
  }

  /// `Edit Product`
  String get storeEditProductButton {
    return Intl.message(
      'Edit Product',
      name: 'storeEditProductButton',
      desc: '',
      args: [],
    );
  }

  /// `Remove Store`
  String get storeRemoveButton {
    return Intl.message(
      'Remove Store',
      name: 'storeRemoveButton',
      desc: '',
      args: [],
    );
  }

  /// `Add Product`
  String get storeAddProductButton {
    return Intl.message(
      'Add Product',
      name: 'storeAddProductButton',
      desc: '',
      args: [],
    );
  }

  /// `This information is used to set up \nyour shop`
  String get storeDetailTitle {
    return Intl.message(
      'This information is used to set up \nyour shop',
      name: 'storeDetailTitle',
      desc: '',
      args: [],
    );
  }

  /// `Store Name`
  String get storeNameLabel {
    return Intl.message(
      'Store Name',
      name: 'storeNameLabel',
      desc: '',
      args: [],
    );
  }

  /// `Store Web Address`
  String get storeWebAddressLabel {
    return Intl.message(
      'Store Web Address',
      name: 'storeWebAddressLabel',
      desc: '',
      args: [],
    );
  }

  /// `Store Description`
  String get storeDescriptionLabel {
    return Intl.message(
      'Store Description',
      name: 'storeDescriptionLabel',
      desc: '',
      args: [],
    );
  }

  /// `Store Type`
  String get storeTypeLabel {
    return Intl.message(
      'Store Type',
      name: 'storeTypeLabel',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get storeAddressLabel {
    return Intl.message(
      'Address',
      name: 'storeAddressLabel',
      desc: '',
      args: [],
    );
  }

  /// `City`
  String get storeCityLabel {
    return Intl.message(
      'City',
      name: 'storeCityLabel',
      desc: '',
      args: [],
    );
  }

  /// `Country`
  String get storeCountryLabel {
    return Intl.message(
      'Country',
      name: 'storeCountryLabel',
      desc: '',
      args: [],
    );
  }

  /// `Courier Name`
  String get storeCourierNameLabel {
    return Intl.message(
      'Courier Name',
      name: 'storeCourierNameLabel',
      desc: '',
      args: [],
    );
  }

  /// `Tagline`
  String get storeTaglineLabel {
    return Intl.message(
      'Tagline',
      name: 'storeTaglineLabel',
      desc: '',
      args: [],
    );
  }

  /// `Product Name`
  String get storeProductNameLabel {
    return Intl.message(
      'Product Name',
      name: 'storeProductNameLabel',
      desc: '',
      args: [],
    );
  }

  /// `Category Product`
  String get storeCategoryProductLabel {
    return Intl.message(
      'Category Product',
      name: 'storeCategoryProductLabel',
      desc: '',
      args: [],
    );
  }

  /// `Price`
  String get storePriceLabel {
    return Intl.message(
      'Price',
      name: 'storePriceLabel',
      desc: '',
      args: [],
    );
  }

  /// `Offer Price`
  String get storeOfferPriceLabel {
    return Intl.message(
      'Offer Price',
      name: 'storeOfferPriceLabel',
      desc: '',
      args: [],
    );
  }

  /// `Location Details`
  String get storeLocationDetailsLabel {
    return Intl.message(
      'Location Details',
      name: 'storeLocationDetailsLabel',
      desc: '',
      args: [],
    );
  }

  /// `Product Description`
  String get storeProductDescriptionLabel {
    return Intl.message(
      'Product Description',
      name: 'storeProductDescriptionLabel',
      desc: '',
      args: [],
    );
  }

  /// `Price Type`
  String get storePriceTypeLabel {
    return Intl.message(
      'Price Type',
      name: 'storePriceTypeLabel',
      desc: '',
      args: [],
    );
  }

  /// `Additional Details`
  String get storeAddDeataisLabel {
    return Intl.message(
      'Additional Details',
      name: 'storeAddDeataisLabel',
      desc: '',
      args: [],
    );
  }

  /// `Add photos`
  String get storeAddPhotoTitle {
    return Intl.message(
      'Add photos',
      name: 'storeAddPhotoTitle',
      desc: '',
      args: [],
    );
  }

  /// `1600 x 1200 for hi res`
  String get storeAddPhotoDescription {
    return Intl.message(
      '1600 x 1200 for hi res',
      name: 'storeAddPhotoDescription',
      desc: '',
      args: [],
    );
  }

  /// `Max. 4 photos per product`
  String get storeMaxPhotoProductTitle {
    return Intl.message(
      'Max. 4 photos per product',
      name: 'storeMaxPhotoProductTitle',
      desc: '',
      args: [],
    );
  }

  /// `Please add at least one product image`
  String get storeMessageProduct {
    return Intl.message(
      'Please add at least one product image',
      name: 'storeMessageProduct',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profileTitle {
    return Intl.message(
      'Profile',
      name: 'profileTitle',
      desc: '',
      args: [],
    );
  }

  /// `Edit Profile`
  String get profileEditTitle {
    return Intl.message(
      'Edit Profile',
      name: 'profileEditTitle',
      desc: '',
      args: [],
    );
  }

  /// `Language & Currency`
  String get profileLanguageCurrencyTitle {
    return Intl.message(
      'Language & Currency',
      name: 'profileLanguageCurrencyTitle',
      desc: '',
      args: [],
    );
  }

  /// `Feedback`
  String get profileFeedbackTitle {
    return Intl.message(
      'Feedback',
      name: 'profileFeedbackTitle',
      desc: '',
      args: [],
    );
  }

  /// `Refer a Friend`
  String get profileReferFriendTitle {
    return Intl.message(
      'Refer a Friend',
      name: 'profileReferFriendTitle',
      desc: '',
      args: [],
    );
  }

  /// `Terms & Conditions`
  String get profileTermsAndConditionsTitle {
    return Intl.message(
      'Terms & Conditions',
      name: 'profileTermsAndConditionsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get profileLogoutTitle {
    return Intl.message(
      'Logout',
      name: 'profileLogoutTitle',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
