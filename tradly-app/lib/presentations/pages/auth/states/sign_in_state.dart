import 'package:equatable/equatable.dart';
import 'package:tradly_app/core/utils/enumeration.dart';

class SignInState extends Equatable {
  const SignInState({
    required this.viewState,
    this.email = '',
    this.password = '',
    this.isFormValid = false,
    this.errorMessage,
    this.sessionToken,
  });

  final SubmissionStatus viewState;
  final String email;
  final String password;
  final bool isFormValid;
  final String? errorMessage;
  final String? sessionToken;

  SignInState copyWith({
    SubmissionStatus? viewState,
    String? errorMessage,
    bool? isFormValid,
    String? email,
    String? password,
    String? sessionToken,
  }) {
    return SignInState(
      viewState: viewState ?? this.viewState,
      errorMessage: errorMessage ?? this.errorMessage,
      isFormValid: isFormValid ?? this.isFormValid,
      email: email ?? this.email,
      password: password ?? this.password,
      sessionToken: sessionToken ?? this.sessionToken,
    );
  }

  @override
  List<Object?> get props => [
        viewState,
        errorMessage,
        isFormValid,
        email,
        password,
        sessionToken,
      ];
}
