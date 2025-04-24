import 'package:tradly_app/core/resources/l10n_generated/l10n.dart';

mixin InputValidationMixin {
  static String? validFirstName(String firstName) {
    if (firstName.isEmpty) {
      return S.current.validatorFirstNameRequired;
    }
    return null;
  }

  static String? validLastName(String lastName) {
    if (lastName.isEmpty) {
      return S.current.validatorLastNameRequired;
    }
    return null;
  }

  static String? validEmailOrPhone(String input) {
    if (input.isEmpty) {
      return S.current.validatorEmailOrPhoneNumberRequired;
    } else if (!RegExpValidator.regExpEmail.hasMatch(input) &&
        !RegExpValidator.regExpPhone.hasMatch(input)) {
      return S.current.validatorEmailWrongFormat;
    }
    return null;
  }

  static String? validPassword(String password) {
    if (password.isEmpty) {
      return S.current.validatorPasswordRequired;
    } else if (password.length < 8) {
      return S.current.validatorPasswordCharacterMinimum;
    } else if (!RegExpValidator.regExpPassword.hasMatch(password)) {
      return S.current.validatorPasswordWrongFormat;
    }
    return null;
  }

  static String? validConfirmPassword({
    required String confirmPassword,
  }) {
    if (confirmPassword.isEmpty) {
      return S.current.validatorConfirmPasswordRequired;
    }
    return null;
  }

  static String? validConfirmation({
    required String needConfirm,
    required String confirm,
  }) {
    if (needConfirm.length < 8) {
      return S.current.validatorPasswordCharacterMinimum;
    } else if (needConfirm != confirm) {
      return S.current.validatorConfirmedPasswordNotMatch;
    }
    return null;
  }

  static String? validReEnterPassword({
    required String password,
    required String reEnterPassword,
  }) {
    if (reEnterPassword.isEmpty) {
      return S.current.validatorConfirmPasswordRequired;
    } else if (password != reEnterPassword) {
      return S.current.validatorConfirmedPasswordNotMatch;
    }
    return null;
  }
}

class RegExpValidator {
  static final RegExp regExpEmail = RegExp(
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
  );

  static final RegExp regExpPassword = RegExp('^(?=.*?[a-z])(?=.*?[A-Z]){8,}');

  static final RegExp regExpPhone = RegExp(r'^\+?[0-9]{7,15}$');
}
