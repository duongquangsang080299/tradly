import 'package:equatable/equatable.dart';

abstract class SignInEvent extends Equatable {
  const SignInEvent();

  @override
  List<Object?> get props => [];
}

class SignInFormValidateChangedEvt extends SignInEvent {
  const SignInFormValidateChangedEvt({
    required this.isValidate,
    this.email,
    this.password,
  });
  final bool isValidate;
  final String? email;
  final String? password;

  @override
  List<Object?> get props => [
        email,
        password,
        isValidate,
      ];
}

class SignInButtonPressedEvt extends SignInEvent {
  const SignInButtonPressedEvt();

  @override
  List<Object?> get props => [];
}
