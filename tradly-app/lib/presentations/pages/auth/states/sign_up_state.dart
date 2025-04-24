import 'package:equatable/equatable.dart';
import 'package:tradly_app/core/utils/enumeration.dart';

class SignUpState extends Equatable {
  const SignUpState({
    required this.viewState,
    this.username = '',
    this.emailOrPhoneNumber = '',
    this.password = '',
    this.confirmPassword = '',
    this.isFormValid = false,
    this.errorMessage,
  });

  final SubmissionStatus viewState;
  final String username;
  final String emailOrPhoneNumber;
  final String password;
  final String confirmPassword;
  final bool isFormValid;
  final String? errorMessage;

  SignUpState copyWith({
    SubmissionStatus? viewState,
    String? username,
    String? emailOrPhoneNumber,
    String? password,
    String? confirmPassword,
    bool? isFormValid,
    String? errorMessage,
  }) {
    return SignUpState(
      viewState: viewState ?? this.viewState,
      username: username ?? this.username,
      emailOrPhoneNumber: emailOrPhoneNumber ?? this.emailOrPhoneNumber,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      isFormValid: isFormValid ?? this.isFormValid,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        viewState,
        username,
        emailOrPhoneNumber,
        password,
        confirmPassword,
        isFormValid,
        errorMessage,
      ];
}
