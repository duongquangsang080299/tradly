import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tradly_app/data/repositories/auth_repo.dart';
import 'package:tradly_app/core/utils/enumeration.dart';
import 'sign_in_event.dart';
import 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final AuthRepository authRepository;

  SignInBloc({required this.authRepository})
      : super(const SignInState(viewState: SubmissionStatus.initial)) {
    on<SignInFormValidateChangedEvt>(_onFormValidateChanged);
    on<SignInButtonPressedEvt>(_onLoginPressed);
  }

  Future<void> _onFormValidateChanged(
    SignInFormValidateChangedEvt event,
    Emitter<SignInState> emit,
  ) async {
    emit(
      state.copyWith(
        isFormValid: event.isValidate,
        password: event.password,
        email: event.email,
      ),
    );
  }

  Future<void> _onLoginPressed(
    SignInButtonPressedEvt event,
    Emitter<SignInState> emit,
  ) async {
    emit(state.copyWith(viewState: SubmissionStatus.loading));
    try {
      final response = await authRepository.signIn(
        email: state.email,
        password: state.password,
      );
      emit(
        state.copyWith(
          viewState: response.user != null
              ? SubmissionStatus.successful
              : SubmissionStatus.failed,
          errorMessage: response.user != null ? '' : '',
          sessionToken: response.session?.accessToken,
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
