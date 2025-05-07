import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tradly_app/data/repositories/auth_repo.dart';
import 'package:tradly_app/core/utils/enumeration.dart';
import 'sign_up_event.dart';
import 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final AuthRepository authRepository;

  SignUpBloc({required this.authRepository})
      : super(const SignUpState(viewState: SubmissionStatus.initial)) {
    on<SignUpFormValidateChangedEvt>(_onFormValidateChanged);
    on<SignUpButtonPressedEvt>(_onSignUpPressed);
  }

  void _onFormValidateChanged(
    SignUpFormValidateChangedEvt event,
    Emitter<SignUpState> emit,
  ) {
    emit(
      state.copyWith(
        isFormValid: event.isValidate,
        username: event.username,
        emailOrPhoneNumber: event.emailOrPhoneNumber,
        password: event.password,
        confirmPassword: event.confirmPassword,
      ),
    );
  }

  Future<void> _onSignUpPressed(
    SignUpButtonPressedEvt event,
    Emitter<SignUpState> emit,
  ) async {
    emit(state.copyWith(viewState: SubmissionStatus.loading));
    try {
      final response = await authRepository.signUp(
        emailOrPhoneNumber: state.emailOrPhoneNumber,
        password: state.password,
        username: state.username,
      );
      emit(
        state.copyWith(
          viewState: response.user != null
              ? SubmissionStatus.successful
              : SubmissionStatus.failed,
          errorMessage: response.user != null ? '' : 'Sign-up failed',
        ),
      );
    } catch (e) {
      emit(state.copyWith(
        viewState: SubmissionStatus.failed,
        errorMessage: e.toString(),
      ));
    }
  }
}
