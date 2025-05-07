import 'package:intl/intl.dart';

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

String dateTimeFormat(DateTime date) {
  String convertedDate = DateFormat("MMMM yyyy").format(date);
  return convertedDate;
}
