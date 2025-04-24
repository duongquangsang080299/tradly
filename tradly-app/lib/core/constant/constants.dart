import 'package:intl/intl.dart';

class Constants {
  static const String dateFormat = '13 Sep, 2020';
  static const List<String> sizes = ["S", "M", "L", "XL", "2XL"];
}

class DioExceptionMessages {
  static const String unauthenticated = 'Unauthenticated';
  static const String connectionTimeout = 'Connection request timeout';
  static const String sendTimeout =
      'Send timeout in connection with API server';
  static const String receiveTimeout =
      'Send timeout in connection with API server';
  static const String cancel = 'Request Cancelled';
  static const String connectionError = 'No internet connection';
  static const String unexpectedErrorOccurred = 'Unexpected error occurred';
}

class DesignConstants {
  static const double widthMobile = 375;
  static const double heightMobile = 812;
  static const double widthTabletPortrait = 768;
  static const double heightTabletPortrait = 1024;
  static const double widthTabletLandscape = 1024;
  static const double heightTabletLandscape = 768;
  static const double widthMobileLandscape = 640;
}

const double vatPercentage = 15;
String dateTimeFormat(DateTime date) {
  String convertedDate = DateFormat("dd MMMM yyyy").format(date);
  return convertedDate;
}
