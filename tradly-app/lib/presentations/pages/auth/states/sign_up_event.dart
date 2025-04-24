import 'package:equatable/equatable.dart';

abstract class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object?> get props => [];
}

class SignUpFormValidateChangedEvt extends SignUpEvent {
  const SignUpFormValidateChangedEvt({
    required this.isValidate,
    this.username,
    this.emailOrPhoneNumber,
    this.password,
    this.confirmPassword,
  });

  final bool isValidate;
  final String? username;
  final String? emailOrPhoneNumber;
  final String? password;
  final String? confirmPassword;

  @override
  List<Object?> get props => [
        isValidate,
        username,
        emailOrPhoneNumber,
        password,
        confirmPassword,
      ];
}

class SignUpButtonPressedEvt extends SignUpEvent {
  const SignUpButtonPressedEvt();

  @override
  List<Object?> get props => [];
}
