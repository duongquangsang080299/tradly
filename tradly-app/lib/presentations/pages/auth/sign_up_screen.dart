import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tradly_app/core/extensions/context_extensions.dart';
import 'package:tradly_app/core/resources/l10n_generated/l10n.dart';
import 'package:tradly_app/core/routes/app_router.dart';
import 'package:tradly_app/presentations/pages/auth/states/sign_up_bloc.dart';
import 'package:tradly_app/presentations/pages/auth/states/sign_up_event.dart';
import 'package:tradly_app/presentations/pages/auth/states/sign_up_state.dart';
import 'package:tradly_app/core/utils/enumeration.dart';
import 'package:tradly_app/presentations/widgets/button.dart';
import 'package:tradly_app/presentations/widgets/form.dart';
import 'package:tradly_app/presentations/widgets/indicator.dart';
import 'package:tradly_app/presentations/layouts/app_bar.dart';
import 'package:tradly_app/presentations/widgets/text_field.dart';
import 'package:tradly_app/presentations/widgets/snackbar.dart';
import 'package:tradly_app/presentations/widgets/text.dart';
import 'package:tradly_app/data/repositories/auth_repo.dart';
import 'package:tradly_app/core/utils/validators.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> with InputValidationMixin {
  final _authRepository = AuthRepositoryImplement(Supabase.instance.client);
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailOrPhoneNumberController = TextEditingController();
  final _passwordController = TextEditingController();
  final _reEnterPasswordController = TextEditingController();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailOrPhoneNumberController.dispose();
    _passwordController.dispose();
    _reEnterPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: BlocProvider(
        create: (context) => SignUpBloc(
          authRepository: _authRepository,
        ),
        child: BlocListener<SignUpBloc, SignUpState>(
          listener: (context, state) {
            if (state.viewState == SubmissionStatus.loading) {
              LALoadingIndicator.show(context);
            } else if (state.viewState == SubmissionStatus.successful) {
              LALoadingIndicator.hide(context);
              if (state.emailOrPhoneNumber.contains('@')) {
                context.pop();
              } else {
                context.pushNamed(TAPaths.sendOTP.name);
              }
            } else if (state.viewState == SubmissionStatus.failed) {
              LALoadingIndicator.hide(context);
              TASnackBar.buildErrorSnackbar(
                context,
                state.errorMessage ?? '',
              );
            }
          },
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: context.colorScheme.primary,
            appBar: TaAppBar(
              toolbarHeight: TaAppBarSize.medium,
              backgroundColor: context.colorScheme.primary,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
            body: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TaDisplaySmallText(
                        text: S.current.signUpWelcomeTitle,
                      ),
                      const SizedBox(height: 66),
                      TaHeadlineSmallText(
                        text: S.current.signUpTitle,
                      ),
                      const SizedBox(height: 25),
                      BlocBuilder<SignUpBloc, SignUpState>(
                        buildWhen: (previous, current) =>
                            previous.isFormValid != current.isFormValid,
                        builder: (context, state) => TAForm(
                          isValidated: (isValid) => context
                              .read<SignUpBloc>()
                              .add(
                                SignUpFormValidateChangedEvt(
                                  isValidate: isValid,
                                  username:
                                      '${_firstNameController.text.trim()} ${_lastNameController.text.trim()}',
                                  emailOrPhoneNumber:
                                      _emailOrPhoneNumberController.text.trim(),
                                  password: _passwordController.text,
                                  confirmPassword:
                                      _reEnterPasswordController.text,
                                ),
                              ),
                          textFields: [
                            TATextField(
                              controller: _firstNameController,
                              textInputAction: TextInputAction.next,
                              label: S.current.signUpFirstNameLabel,
                              useMaterialStyle: false,
                              labelStyle: TextStyle(
                                color: context.colorScheme.onPrimary,
                              ),
                              textStyle: TextStyle(
                                color: context.colorScheme.onPrimary,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                              validator: (value) =>
                                  InputValidationMixin.validFirstName(
                                      value ?? ''),
                            ),
                            TATextField(
                              controller: _lastNameController,
                              textInputAction: TextInputAction.next,
                              label: S.current.signUpLastNameLabel,
                              useMaterialStyle: false,
                              labelStyle: TextStyle(
                                color: context.colorScheme.onPrimary,
                              ),
                              textStyle: TextStyle(
                                color: context.colorScheme.onPrimary,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                              validator: (value) =>
                                  InputValidationMixin.validLastName(
                                      value ?? ''),
                            ),
                            TATextField(
                              controller: _emailOrPhoneNumberController,
                              textInputAction: TextInputAction.next,
                              label: S.current.signInEmailOrMobileLabel,
                              useMaterialStyle: false,
                              keyboardType: TextInputType.emailAddress,
                              labelStyle: TextStyle(
                                color: context.colorScheme.onPrimary,
                              ),
                              textStyle: TextStyle(
                                color: context.colorScheme.onPrimary,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                              validator: (value) =>
                                  InputValidationMixin.validEmailOrPhone(
                                      value ?? ''),
                            ),
                            TATextField(
                              controller: _passwordController,
                              label: S.current.signInPasswordLabel,
                              useMaterialStyle: false,
                              isPassword: true,
                              textInputAction: TextInputAction.next,
                              labelStyle: TextStyle(
                                color: context.colorScheme.onPrimary,
                              ),
                              textStyle: TextStyle(
                                color: context.colorScheme.onPrimary,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                              validator: (value) =>
                                  InputValidationMixin.validPassword(
                                      value ?? ''),
                            ),
                            TATextField(
                              controller: _reEnterPasswordController,
                              label: S.current.signUpReEnterPasswordLabel,
                              useMaterialStyle: false,
                              isPassword: true,
                              labelStyle: TextStyle(
                                color: context.colorScheme.onPrimary,
                              ),
                              textStyle: TextStyle(
                                color: context.colorScheme.onPrimary,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                              validator: (value) =>
                                  InputValidationMixin.validReEnterPassword(
                                password: _passwordController.text,
                                reEnterPassword: value ?? '',
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 38),
                      BlocBuilder<SignUpBloc, SignUpState>(
                        builder: (context, state) => TAElevatedButton(
                          isDisabled: !state.isFormValid,
                          fontWeight: FontWeight.w500,
                          text: S.current.signUpCreateButton,
                          textSize: 16,
                          textColor: context.colorScheme.primary,
                          backgroundColor: state.isFormValid
                              ? context.colorScheme.onPrimary
                              : context.colorScheme.onPrimary.withOpacity(0.5),
                          onPressed: () {
                            if (_formKey.currentState?.validate() ?? false) {
                              context
                                  .read<SignUpBloc>()
                                  .add(SignUpButtonPressedEvt());
                            }
                          },
                        ),
                      ),
                      const SizedBox(height: 38),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: RichText(
                          text: TextSpan(
                            text: S.current.signUpAlreadyAcccount,
                            style: context.textTheme.headlineMedium?.copyWith(
                              fontSize: 18,
                            ),
                            children: [
                              TextSpan(
                                text: S.current.signInButton,
                                style:
                                    context.textTheme.headlineMedium?.copyWith(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
